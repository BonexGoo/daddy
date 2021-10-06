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
    void load(dString filepath, const dDirectory::FileStatus& status);

private:
    char typecode() const override {return 'F';}

DD_escaper(FileDataP, GUIDataP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
        mSize = 0;
        mHash = 0;
        mDate = 0;
    }
    void _quit_()
    {
        _super_::_quit_();
    }
    dString mPath;
    uint64_t mSize;
    uint64_t mHash;
    uint64_t mDate;
};

void FileDataP::load(dString filepath, const dDirectory::FileStatus& status)
{
    mPath = filepath;
    mSize = status.mFileSize;
    mHash = dUnique::generateHash(mPath);
    mDate = status.mLastWriteTime;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ IODirDataP
class IODirDataP : public GUIDataP
{
public:
    void load(const dMarkup& yaml);

private:
    char typecode() const override {return 'I';}

DD_escaper(IODirDataP, GUIDataP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
    }
    void _quit_()
    {
        _super_::_quit_();
    }
    std::map<std::string, IODirDataP> mDirs;
    std::map<std::string, FileDataP> mFiles;
};

void IODirDataP::load(const dMarkup& yaml)
{
    //////////////////////////////////// 여기서부터!!!!
    ////////////////////////////////////
    ////////////////////////////////////
    ////////////////////////////////////

    /*const dDirectory NewDirectory(dirpath);

    mDirs.clear();
    for(const auto& it : NewDirectory.dirs())
        mDirs[it.first].load(dirpath + '/' + it.first.c_str());

    mFiles.clear();
    for(const auto& it : NewDirectory.files())
        mFiles[it.first].load(dirpath + '/' + it.first.c_str(), it.second);*/
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ LocalDirDataP
class LocalDirDataP : public GUIDataP
{
public:
    void load(dString dirpath);
    uint32_t render(uint32_t deep, uint32_t pos, const dPatcher::RenderCB& renderer) const;
    void toggleExpand();

public:
    static LocalDirDataP* toClass(ptr_u handle)
    {
        if(auto CurGUIData = (GUIDataP*) handle)
        if(CurGUIData->typecode() == 'D')
            return (LocalDirDataP*) CurGUIData;
        return nullptr;
    }

private:
    char typecode() const override {return 'D';}

DD_escaper(LocalDirDataP, GUIDataP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
        mExpanded = true;
    }
    void _quit_()
    {
        _super_::_quit_();
    }
    bool mExpanded;
    std::map<std::string, LocalDirDataP> mDirs;
    std::map<std::string, FileDataP> mFiles;
};

void LocalDirDataP::load(dString dirpath)
{
    const dDirectory NewDirectory(dirpath);

    mDirs.clear();
    for(const auto& it : NewDirectory.dirs())
        mDirs[it.first].load(dirpath + '/' + it.first.c_str());

    mFiles.clear();
    for(const auto& it : NewDirectory.files())
        mFiles[it.first].load(dirpath + '/' + it.first.c_str(), it.second);
}

uint32_t LocalDirDataP::render(uint32_t deep, uint32_t pos, const dPatcher::RenderCB& renderer) const
{
    dPatcher::RenderStatus Status;
    Status.mDeep = deep;
    Status.mPos = pos;

    if(mExpanded)
    {
        Status.mFolder = true;
        for(const auto& it : mDirs)
        {
            Status.mExpanded = it.second.mExpanded;
            Status.mPos = renderer(it.second.ui(), Status, it.first);
            Status.mPos = it.second.render(Status.mDeep + 1, Status.mPos, renderer);
        }

        Status.mFolder = false;
        Status.mExpanded = false;
        for(const auto& it : mFiles)
            Status.mPos = renderer(it.second.ui(), Status, it.first);
    }
    return Status.mPos;
}

void LocalDirDataP::toggleExpand()
{
    mExpanded ^= true;
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
        [](ptr_u handle)->void {delete (IODirDataP*)(GUIDataP*) handle;});
}

dPatcher::LocalData dPatcher::readyForLocal(dLiteral dirpath)
{
    auto NewLocalDirData = new LocalDirDataP();
    NewLocalDirData->load(dirpath);
    return dPatcher::LocalData((ptr_u)(GUIDataP*) NewLocalDirData,
        [](ptr_u handle)->void {delete (LocalDirDataP*)(GUIDataP*) handle;});
}

dPatcher::Schedule dPatcher::build(IOData io, LocalData local)
{
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

uint32_t dPatcher::renderOnce(LocalData local, RenderCB renderer)
{
    if(auto CurDirData = local.get<const LocalDirDataP>())
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
