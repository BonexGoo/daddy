/// @brief     Definition of patcher class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_patcher.hpp"

// Dependencies
#include "dd_markup.hpp"
#include "dd_platform.hpp"
#include "dd_unique.hpp"
#include <map>
#include <string>

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ GUIDataP
class GUIDataP : public dEscaper
{
public:
    uint32_t ui() const
    {
        return mUI;
    }
    static GUIDataP* at(uint32_t ui)
    {
        return MAP().at(ui);
    }
    virtual char typecode() const = 0;

private:
    typedef std::map<uint32_t, GUIDataP*> GUIDataMap;
    static GUIDataMap& MAP()
    {
        DD_global_direct(GUIDataMap, _);
        return _;
    }
    uint32_t generatedUI()
    {
        DD_global_direct(uint32_t, LastUI, 0);
        return ++LastUI;
    }

DD_escaper(GUIDataP, dEscaper, mUI(generatedUI())):
    void _init_(InitType type)
    {
        if(type == InitType::Create)
            MAP()[mUI] = this;
    }
    void _quit_()
    {
        MAP().erase(mUI);
    }
    const uint32_t mUI;
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ FileDataP
class FileDataP : public GUIDataP
{
public:
    void load(dString path, uint64_t size, uint64_t hash, uint64_t date);
    void load(dString path, const dDirectory::FileStatus& status);
    static bool compare(FileDataP& a, FileDataP& b);
    inline void setAdded() {mCompare = dPatcher::CT_Added;}
    inline void setRemoved() {mCompare = dPatcher::CT_Removed;}
    inline dPatcher::comparetype comparetype() const {return mCompare;}

private:
    char typecode() const override {return 'F';}

DD_escaper(FileDataP, GUIDataP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
        mCompare = dPatcher::CT_Same;
        mSize = 0;
        mHash = 0;
        mDate = 0;
    }
    void _quit_()
    {
        _super_::_quit_();
    }
    dPatcher::comparetype mCompare;
    dString mPath;
    uint64_t mSize;
    uint64_t mHash;
    uint64_t mDate;
};

void FileDataP::load(dString path, uint64_t size, uint64_t hash, uint64_t date)
{
    mPath = path;
    mSize = size;
    mHash = hash;
    mDate = date;
}

void FileDataP::load(dString path, const dDirectory::FileStatus& status)
{
    mPath = path;
    mSize = status.mFileSize;
    mHash = dUnique::generateHash(mPath);
    mDate = status.mLastWriteTime;
}

bool FileDataP::compare(FileDataP& a, FileDataP& b)
{
    if(a.mSize != b.mSize || a.mHash != b.mHash)
    {
        a.mCompare = dPatcher::CT_Different;
        b.mCompare = dPatcher::CT_Different;
        return true;
    }
    return false;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ DirDataP
class DirDataP : public GUIDataP
{
public:
    uint32_t render(uint32_t deep, uint32_t pos, const dPatcher::RenderCB& renderer) const;
    void toggleExpand();
    static bool compare(DirDataP& a, DirDataP& b);
    inline void setAdded() {mCompare = dPatcher::CT_Added;}
    static DirDataP* newRemoved()
    {
        DirDataP* Result = new DirDataP();
        Result->mCompare = dPatcher::CT_Removed;
        return Result;
    }

public:
    static DirDataP* toClass(ptr_u handle)
    {
        if(auto CurGUIData = (GUIDataP*) handle)
        if(CurGUIData->typecode() == 'D')
            return (DirDataP*) CurGUIData;
        return nullptr;
    }

private:
    char typecode() const override {return 'D';}

protected:
    void clear();

DD_escaper(DirDataP, GUIDataP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
        mExpanded = true;
        mCompare = dPatcher::CT_Same;
    }
    void _quit_()
    {
        _super_::_quit_();
        for(const auto& it : mDirPtrs)
            delete it.second;
    }
    bool mExpanded;
    dPatcher::comparetype mCompare;
    std::map<std::string, DirDataP*> mDirPtrs;
    std::map<std::string, FileDataP> mFiles;
};

uint32_t DirDataP::render(uint32_t deep, uint32_t pos, const dPatcher::RenderCB& renderer) const
{
    dPatcher::RenderStatus Status;
    Status.mDeep = deep;
    Status.mPos = pos;

    if(mExpanded)
    {
        Status.mFolder = true;
        for(const auto& it : mDirPtrs)
        {
            Status.mExpanded = it.second->mExpanded;
            Status.mCompare = it.second->mCompare;
            Status.mPos = renderer(it.second->ui(), Status, it.first);
            Status.mPos = it.second->render(Status.mDeep + 1, Status.mPos, renderer);
        }

        Status.mFolder = false;
        Status.mExpanded = false;
        for(const auto& it : mFiles)
        {
            Status.mCompare = it.second.comparetype();
            Status.mPos = renderer(it.second.ui(), Status, it.first);
        }
    }
    return Status.mPos;
}

void DirDataP::toggleExpand()
{
    mExpanded ^= true;
}

bool DirDataP::compare(DirDataP& a, DirDataP& b)
{
    bool IsDiff = false;
    // 디렉토리
    {
        auto itA = a.mDirPtrs.begin();
        auto itB = b.mDirPtrs.begin();
        bool nextA = (itA != a.mDirPtrs.end());
        bool nextB = (itB != b.mDirPtrs.end());
        while(nextA || nextB)
        {
            // 비교
            int Compare = 0;
            if(nextA && nextB)
                Compare = itA->first.compare(itB->first);
            else if(nextA) Compare = -1;
            else Compare = 1;

            // 처리
            if(Compare == 0)
            {
                IsDiff |= compare(*itA->second, *itB->second);
                nextA = (++itA != a.mDirPtrs.end());
                nextB = (++itB != b.mDirPtrs.end());
            }
            else
            {
                IsDiff = true;
                if(Compare < 0)
                {
                    itA->second->setAdded();
                    auto NewB = DirDataP::newRemoved();
                    compare(*itA->second, *NewB);
                    b.mDirPtrs[itA->first] = NewB;
                    nextA = (++itA != a.mDirPtrs.end());
                }
                else
                {
                    itB->second->setAdded();
                    auto NewA = DirDataP::newRemoved();
                    compare(*NewA, *itB->second);
                    a.mDirPtrs[itB->first] = NewA;
                    nextB = (++itB != b.mDirPtrs.end());
                }
            }
        }
    }

    // 파일
    {
        auto itA = a.mFiles.begin();
        auto itB = b.mFiles.begin();
        bool nextA = (itA != a.mFiles.end());
        bool nextB = (itB != b.mFiles.end());
        while(nextA || nextB)
        {
            // 비교
            int Compare = 0;
            if(nextA && nextB)
                Compare = itA->first.compare(itB->first);
            else if(nextA) Compare = -1;
            else Compare = 1;

            // 처리
            if(Compare == 0)
            {
                IsDiff |= FileDataP::compare(itA->second, itB->second);
                nextA = (++itA != a.mFiles.end());
                nextB = (++itB != b.mFiles.end());
            }
            else
            {
                IsDiff = true;
                if(Compare < 0)
                {
                    itA->second.setAdded();
                    b.mFiles[itA->first].setRemoved();
                    nextA = (++itA != a.mFiles.end());
                }
                else
                {
                    itB->second.setAdded();
                    a.mFiles[itB->first].setRemoved();
                    nextB = (++itB != b.mFiles.end());
                }
            }
        }
    }
    return IsDiff;
}

void DirDataP::clear()
{
    for(const auto& it : mDirPtrs)
        delete it.second;
    mDirPtrs.clear();
    mFiles.clear();
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ IODirDataP
class IODirDataP : public DirDataP
{
public:
    void load(const dMarkup& yaml);

DD_escaper(IODirDataP, DirDataP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
    }
    void _quit_()
    {
        _super_::_quit_();
    }
};

void IODirDataP::load(const dMarkup& yaml)
{
    clear();
    DD_hook(yaml("files"))
    for(uint32_t i = 0, iend = DD_fish.length(); i < iend; ++i)
    {
        DD_hook(DD_fish[i])
        if(DD_fish.isValid())
        {
            IODirDataP* CurDir = this;
            auto& Path = DD_fish("path").get();
            auto PathPtr = Path.string();
            for(uint32_t j = 0, jend = Path.length(), jold = 0; j <= jend; ++j)
            {
                if(j == jend)
                {
                    const std::string Name(&PathPtr[jold], j - jold);
                    const uint64_t Size = uint64_t(DD_fish("size").get().toNumber() & DD_const8u(0xFFFFFFFFFFFFFFFF));
                    const uint64_t Hash = uint64_t(DD_fish("hash").get().toNumber() & DD_const8u(0xFFFFFFFFFFFFFFFF));
                    const uint64_t Date = uint64_t(DD_fish("date").get().toNumber() & DD_const8u(0xFFFFFFFFFFFFFFFF));
                    CurDir->mFiles[Name].load(Path, Size, Hash, Date);
                }
                else if(PathPtr[j] == '/')
                {
                    const std::string Name(&PathPtr[jold], j - jold);
                    if(CurDir->mDirPtrs.find(Name) == CurDir->mDirPtrs.end())
                        CurDir->mDirPtrs[Name] = new IODirDataP();

                    CurDir = (IODirDataP*) CurDir->mDirPtrs[Name];
                    jold = j + 1;
                }
            }
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ LocalDirDataP
class LocalDirDataP : public DirDataP
{
public:
    void load(dString dirpath);

DD_escaper(LocalDirDataP, DirDataP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
    }
    void _quit_()
    {
        _super_::_quit_();
    }
};

void LocalDirDataP::load(dString dirpath)
{
    clear();
    const dDirectory NewDirectory(dirpath);

    for(const auto& it : NewDirectory.dirs())
    {
        if(mDirPtrs.find(it.first) == mDirPtrs.end())
            mDirPtrs[it.first] = new LocalDirDataP();
        ((LocalDirDataP*) mDirPtrs[it.first])->load(dirpath + '/' + it.first.c_str());
    }

    for(const auto& it : NewDirectory.files())
        mFiles[it.first].load(dirpath + '/' + it.first.c_str(), it.second);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ ScheduleP
class ScheduleP
{
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ DownloadScheduleP
class DownloadScheduleP : public ScheduleP
{
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ UploadScheduleP
class UploadScheduleP : public ScheduleP
{
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dPatcher
void dPatcher::setReader(IOReadCB reader)
{
    mReader = reader;
}

void dPatcher::setWriter(IOWriteCB writer)
{
    mWriter = writer;
}

void dPatcher::setLogger(LogCB logger)
{
    mLogger = logger;
}

dPatcher::vercode dPatcher::searchLatestVersion(vercode startversion) const
{
    ////////////////////////////////////////////////////////
    return 0; /////
}

dPatcher::IOData dPatcher::readyForDownload(vercode version) const
{
    return dPatcher::IOData(); /////
}

dPatcher::IOData dPatcher::readyForUpload(vercode startversion) const
{
    const vercode LatestVersion = searchLatestVersion(startversion);
    const dMarkup HashYaml(mReader(LatestVersion, DT_TotalHash, "hash.txt").toString());

    auto NewIODirData = new IODirDataP();
    NewIODirData->load(HashYaml);
    return dPatcher::IOData((ptr_u)(GUIDataP*) NewIODirData,
        [](ptr_u handle)->void {delete (GUIDataP*) handle;});
}

dPatcher::LocalData dPatcher::readyForLocal(dLiteral dirpath)
{
    auto NewLocalDirData = new LocalDirDataP();
    NewLocalDirData->load(dirpath);
    return dPatcher::LocalData((ptr_u)(GUIDataP*) NewLocalDirData,
        [](ptr_u handle)->void {delete (GUIDataP*) handle;});
}

dPatcher::Schedule dPatcher::build(IOData io, LocalData local)
{
    if(auto CurIO = io.get<DirDataP>())
    if(auto CurLocal = local.get<DirDataP>())
        DirDataP::compare(*CurIO, *CurLocal);
    return dPatcher::Schedule(); /////
}

bool dPatcher::drive(Schedule schedule, dLiteral memo) const
{
    //dBinary NewBinary;
    //NewBinary.add((dumps) memo.string(), memo.length());
    //mWriter(0, DT_UploadMemo, "uploader.txt", NewBinary);
    return false; /////
}

dPatcher::Schedule dPatcher::load(dLiteral filepath)
{
    return dPatcher::Schedule(); /////
}

bool dPatcher::save(const Schedule& schedule, dLiteral filepath)
{
    return false; /////
}

dPatcher::worktype dPatcher::getType(const Schedule& schedule)
{
    return WT_NoWork; /////
}

dPatcher::vercode dPatcher::getVersion(const Schedule& schedule)
{
    return 0; /////
}

dString dPatcher::getMemo(const Schedule& schedule)
{
    return ""; /////
}

uint32_t dPatcher::renderOnce(IOData data, RenderCB renderer)
{
    if(auto CurDirData = data.get<const DirDataP>())
        return CurDirData->render(0, 0, renderer);
    return 0;
}

uint32_t dPatcher::renderOnce(LocalData data, RenderCB renderer)
{
    if(auto CurDirData = data.get<const DirDataP>())
        return CurDirData->render(0, 0, renderer);
    return 0;
}

bool dPatcher::toggleExpand(uint32_t ui)
{
    if(auto CurGui = GUIDataP::at(ui))
    if(auto CurDir = LocalDirDataP::toClass((ptr_u) CurGui))
    {
        CurDir->toggleExpand();
        return true;
    }
    return false;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dPatcher::escaper
void dPatcher::_init_(InitType type)
{
    if(type == InitType::Create)
    {
        mReader = [](vercode version, datatype type, dLiteral dataname)->dBinary
        {
            const uint32_t HiNumber = version / 1000;
            const uint32_t LoNumber = version % 1000;
            const dString FilePath = dString::print("dpatcher/p%03u/r%03u%c_%s", HiNumber, LoNumber, type, dataname.buildNative());
            return dBinary::fromFile(FilePath);
        };

        mWriter = [](vercode version, datatype type, dLiteral dataname, const dBinary& data)->bool
        {
            const uint32_t HiNumber = version / 1000;
            const uint32_t LoNumber = version % 1000;
            const dString FilePath = dString::print("dpatcher/p%03u/r%03u%c_%s", HiNumber, LoNumber, type, dataname.buildNative());
            return data.toFile(FilePath, true);
        };

        mLogger = [](steptype type, float progress, dLiteral detail)->void
        {
            switch(type)
            {
            case ST_CheckingForDownload:
                printf("Checking[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            case ST_CleaningForDownload:
                printf("Cleaning[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            case ST_Downloading:
                printf("Downloading[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            case ST_CopyingForUpload:
                printf("Copying[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            case ST_Uploading:
                printf("Uploading[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            }
        };
    }
}

void dPatcher::_quit_()
{
}

void dPatcher::_move_(_self_&& rhs)
{
    mReader = DD_rvalue(rhs.mReader);
    mWriter = DD_rvalue(rhs.mWriter);
    mLogger = DD_rvalue(rhs.mLogger);
}

void dPatcher::_copy_(const _self_& rhs)
{
    mReader = rhs.mReader;
    mWriter = rhs.mWriter;
    mLogger = rhs.mLogger;
}

DD_passage_define_alone(dPatcher, IOReadCB reader, IOWriteCB writer, LogCB logger)
{
    mReader = reader;
    mWriter = writer;
    mLogger = logger;
}

} // namespace Daddy
