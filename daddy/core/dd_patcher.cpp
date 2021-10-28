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

public:
    static dString& MEMO()
    {
        DD_global_direct(dString, _);
        return _;
    }

protected:
    static dString generateSafePath(dLiteral path);

private:
    typedef std::map<uint32_t, GUIDataP*> GUIDataMap;
    static GUIDataMap& MAP()
    {
        DD_global_direct(GUIDataMap, _);
        return _;
    }
    static uint32_t generatedUI()
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

dString GUIDataP::generateSafePath(dLiteral path)
{
    auto RevSame = [](utf8s lastptr, utf8s key, int32_t len)->bool
    {
        for(int32_t i = 1; i <= len; ++i)
            if(key[len - i] != lastptr[-i])
                return false;
        return true;
    };
    dBinary SafePath = dString(path).toBinaryUTF8(false);
    const uint32_t SafePathLength = SafePath.length();

    // 기본 가공
    if(utf8* Ptr = (utf8*) SafePath.buffer())
    {
        for(uint32_t i = 0; i < SafePathLength; ++i)
        {
            switch(Ptr[i])
            {
            case '\\': Ptr[i] = '$'; break;
            case '/': Ptr[i] = '$'; break;
            case ' ': Ptr[i] = '+'; break;
            case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': case 'G':
            case 'H': case 'I': case 'J': case 'K': case 'L': case 'M': case 'N':
            case 'O': case 'P': case 'Q': case 'R': case 'S': case 'T': case 'U':
            case 'V': case 'W': case 'X': case 'Y': case 'Z': Ptr[i] += 'a' - 'A'; break;
            }
        }
    }

    // 특수 가공
    if(utf8s LastPtr = utf8s(SafePath.buffer() + SafePathLength))
    {
        // 빈폴더 처리
        if(RevSame(LastPtr, DD_string_pair("$")))
            SafePath.add((dumps) DD_string_pair("_blankdir_.txt"));
        // 안전하지 않은 확장자
        else if(SafePathLength < 4 || (
            !RevSame(LastPtr, DD_string_pair(".txt")) &&
            !RevSame(LastPtr, DD_string_pair(".bmp")) &&
            !RevSame(LastPtr, DD_string_pair(".png")) &&
            !RevSame(LastPtr, DD_string_pair(".jpg")) &&
            !RevSame(LastPtr, DD_string_pair(".gif"))))
            SafePath.add((dumps) DD_string_pair("_unknownfmt_.txt"));
    }
    return dString::fromBinaryUTF8(SafePath);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ FileDataP
class FileDataP : public GUIDataP
{
public:
    void load(const dMarkup& file);
    void load(dString filepath, uint32_t rootpos, const dDirectory::FileStatus& file);
    static bool compare(FileDataP& a, FileDataP& b);
    void save(dMarkup& filelist, dPatcher::vercode version, dString lpath) const;
    void saveForRemoved(dMarkup& filelist, dPatcher::vercode version, dString lpath) const;
    inline void setSame() {mCompare = dPatcher::CT_Same;}
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
    }
    void _quit_()
    {
        _super_::_quit_();
    }
    dPatcher::comparetype mCompare;
    dString mNote;
    dString mUPath;
    uint64_t mSize;
    dString mHash;
    dString mDate;
};

void FileDataP::load(const dMarkup& file)
{
    mNote = file("note").get();
    mUPath = file("pathU").get();
    mSize = uint64_t(file("size").get().toNumber() & DD_const8u(0xFFFFFFFFFFFFFFFF));
    mHash = file("tag").get();
    mDate = file("time").get();
}

void FileDataP::load(dString filepath, uint32_t rootpos, const dDirectory::FileStatus& file)
{
    mSize = file.mFileSize;
    mHash = dString::print("CRC64_0x%016llx", dUnique::generateHash(filepath));
    mDate = dDirectory::toUTCTime(file.mLastWriteTime);
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

void FileDataP::save(dMarkup& filelist, dPatcher::vercode version, dString lpath) const
{
    auto& NewFile = filelist.atAdding();
    // 이전 노트
    if(0 < mNote.length())
        NewFile.at("note").set(mNote);
    // 새 노트
    else if(0 < GUIDataP::MEMO().length())
        NewFile.at("note").set(GUIDataP::MEMO());

    // 통합명칭 구성
    NewFile.at("pathL").set(lpath);
    if(0 < mUPath.length())
        NewFile.at("pathU").set(mUPath);
    else
    {
        const uint32_t HiVersion = version / 1000;
        const uint32_t LoVersion = version % 1000;
        const dString SafePath = generateSafePath(lpath);
        const dString NewUPath = dString::print("p%03u/r%03uc_%.*s",
            HiVersion, LoVersion, SafePath.length(), SafePath.string());
        NewFile.at("pathU").set(NewUPath);
    }

    NewFile.at("size").set(dString::fromNumber(mSize));
    NewFile.at("tag").set(mHash);
    NewFile.at("time").set(mDate);
}

void FileDataP::saveForRemoved(dMarkup& filelist, dPatcher::vercode version, dString lpath) const
{
    auto& NewFile = filelist.atAdding();
    // 새 노트
    if(0 < GUIDataP::MEMO().length())
        NewFile.at("note").set(GUIDataP::MEMO());

    // 통합명칭 구성
    const uint32_t HiVersion = version / 1000;
    const uint32_t LoVersion = version % 1000;
    const dString SafePath = generateSafePath(lpath);
    const dString NewUPath = dString::print("p%03u/r%03ue_%.*s",
        HiVersion, LoVersion, SafePath.length(), SafePath.string());
    NewFile.at("pathU").set(NewUPath);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ DirDataP
class DirDataP : public GUIDataP
{
public:
    uint32_t render(uint32_t deep, uint32_t pos, const dPatcher::RenderCB& renderer) const;
    void toggleExpand();
    static bool compare(DirDataP& a, DirDataP& b);
    virtual void collect(dMarkup& filelist, dPatcher::vercode version) const {}
    void saveBlankDir(dMarkup& filelist, dPatcher::vercode version, dString lpath, bool removed) const;
    inline void setSame() {mCompare = dPatcher::CT_Same;}
    inline void setAdded() {mCompare = dPatcher::CT_Added;}
    inline dPatcher::comparetype comparetype() const {return mCompare;}
    inline const std::map<std::string, DirDataP*>& dirs() const {return mDirPtrs;}
    inline const std::map<std::string, FileDataP>& files() const {return mFiles;}

public:
    static DirDataP* newRemoved()
    {
        DirDataP* Result = new DirDataP();
        Result->mCompare = dPatcher::CT_Removed;
        return Result;
    }
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
        mRefPair = nullptr;
    }
    void _quit_()
    {
        _super_::_quit_();
        for(const auto& it : mDirPtrs)
            delete it.second;
    }
    bool mExpanded;
    dPatcher::comparetype mCompare;
    DirDataP* mRefPair;
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
        for(const auto& it : mDirPtrs)
        {
            Status.mExpanded = it.second->mExpanded;
            Status.mCompare = it.second->mCompare;
            Status.mPos = renderer(it.second->ui(), Status, it.first);
            Status.mPos = it.second->render(Status.mDeep + 1, Status.mPos, renderer);
        }

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
    if(mRefPair)
        mRefPair->mExpanded = mExpanded;
}

bool DirDataP::compare(DirDataP& a, DirDataP& b)
{
    const bool Expanded = (a.mExpanded || b.mExpanded);
    a.mExpanded = Expanded;
    b.mExpanded = Expanded;
    a.mRefPair = &b;
    b.mRefPair = &a;

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
                itA->second->setSame();
                itB->second->setSame();
                IsDiff |= DirDataP::compare(*itA->second, *itB->second);
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
                    DirDataP::compare(*itA->second, *NewB);
                    b.mDirPtrs[itA->first] = NewB;
                    nextA = (++itA != a.mDirPtrs.end());
                }
                else
                {
                    itB->second->setAdded();
                    auto NewA = DirDataP::newRemoved();
                    DirDataP::compare(*NewA, *itB->second);
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
                itA->second.setSame();
                itB->second.setSame();
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

void DirDataP::saveBlankDir(dMarkup& filelist, dPatcher::vercode version, dString lpath, bool removed) const
{
    auto& NewFile = filelist.atAdding();
    // 새 노트
    if(0 < GUIDataP::MEMO().length())
        NewFile.at("note").set(GUIDataP::MEMO());

    // 통합명칭 구성
    const uint32_t HiVersion = version / 1000;
    const uint32_t LoVersion = version % 1000;
    const dString SafeLPath = generateSafePath(lpath);
    const dString NewUPath = dString::print("p%03u/r%03u%c_%.*s",
        HiVersion, LoVersion, (removed)? 'e' : 'c', SafeLPath.length(), SafeLPath.string());
    NewFile.at("pathU").set(NewUPath);
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
    void load(const dMarkup& filelist);
    void collect(dMarkup& filelist, dPatcher::vercode version) const override;

public:
    inline dPatcher::vercode version() const {return mVersion;}
    inline bool upload() const {return mUpload;}

DD_escaper(IODirDataP, DirDataP, mVersion(0), mUpload(false)):
    void _init_(InitType type)
    {
        _super_::_init_(type);
    }
    void _quit_()
    {
        _super_::_quit_();
    }
    const dPatcher::vercode mVersion;
    const bool mUpload;

public:
    DD_passage_declare(IODirDataP, dPatcher::vercode version, bool upload);
};

void IODirDataP::load(const dMarkup& filelist)
{
    clear();
    DD_hook(filelist("file"))
    for(uint32_t i = 0, iend = DD_fish.length(); i < iend; ++i)
    {
        DD_hook(DD_fish[i])
        if(DD_fish.isValid())
        {
            IODirDataP* CurDir = this;
            auto& LPath = DD_fish("pathL").get();
            auto LPathPtr = LPath.string();
            for(uint32_t j = 0, jend = LPath.length(); j <= jend; ++j)
            {
                if(j == jend && LPathPtr[j - 1] != '/') // 슬래시(/)로 끝나는 경우가 아니어야 파일
                {
                    const std::string ChildName(LPathPtr, j);
                    CurDir->mFiles[ChildName].load(DD_fish);
                }
                else if(LPathPtr[j] == '/')
                {
                    const std::string ChildName(LPathPtr, j + 1); // +1은 슬래시기호
                    if(CurDir->mDirPtrs.find(ChildName) == CurDir->mDirPtrs.end())
                        CurDir->mDirPtrs[ChildName] = new IODirDataP();
                    CurDir = (IODirDataP*) CurDir->mDirPtrs[ChildName];
                }
            }
        }
    }
}

void IODirDataP::collect(dMarkup& filelist, dPatcher::vercode version) const
{
}

DD_passage_define(IODirDataP, dPatcher::vercode version, bool upload), mVersion(version), mUpload(upload)
{
    _init_(InitType::Create);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ LocalDirDataP
class LocalDirDataP : public DirDataP
{
public:
    void load(dString dirpath, uint32_t rootpos);
    void collect(dMarkup& filelist, dPatcher::vercode version) const override;

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

void LocalDirDataP::load(dString dirpath, uint32_t rootpos)
{
    clear();
    const dDirectory Directory(dirpath);

    for(const auto& it : Directory.dirs())
    {
        const dString DirPath = dirpath + it.first.c_str();
        const std::string ChildName(DirPath.string() + rootpos, DirPath.length() - rootpos);
        if(mDirPtrs.find(ChildName) == mDirPtrs.end())
            mDirPtrs[ChildName] = new LocalDirDataP();
        ((LocalDirDataP*) mDirPtrs[ChildName])->load(DirPath, rootpos);
    }

    for(const auto& it : Directory.files())
    {
        const dString FilePath = dirpath + it.first.c_str();
        const std::string ChildName(FilePath.string() + rootpos, FilePath.length() - rootpos);
        mFiles[ChildName].load(FilePath, rootpos, it.second);
    }
}

void LocalDirDataP::collect(dMarkup& filelist, dPatcher::vercode version) const
{
    for(const auto& it : mDirPtrs)
    {
        bool NeedBlankDirCreated = false;
        bool NeedBlankDirRemoved = false;
        switch(it.second->comparetype())
        {
        case dPatcher::CT_Same:
            if(mRefPair)
            DD_hook(mRefPair->dirs())
            {
                auto PairDir = DD_fish.find(it.first);
                if(PairDir != DD_fish.end())
                {
                    // 새 빈폴더정보가 생성될 경우
                    if(0 < PairDir->second->files().size() && it.second->files().size() == 0)
                        NeedBlankDirCreated = true;
                    // 이전 빈폴더정보가 사라질 경우
                    else if(PairDir->second->files().size() == 0 && 0 < it.second->files().size())
                        NeedBlankDirRemoved = true;
                }
            }
            break;
        case dPatcher::CT_Added:
            // 새 빈폴더정보가 생성될 경우
            if(it.second->files().size() == 0)
                NeedBlankDirCreated = true;
            break;
        case dPatcher::CT_Removed:
            // 이전 빈폴더정보가 사라질 경우
            if(mRefPair)
            DD_hook(mRefPair->dirs())
            {
                auto PairDir = DD_fish.find(it.first);
                if(PairDir != DD_fish.end())
                if(PairDir->second->files().size() == 0)
                    NeedBlankDirRemoved = true;
            }
            break;
        }

        if(NeedBlankDirCreated)
            it.second->saveBlankDir(filelist, version, it.first.c_str(), false);
        else if(NeedBlankDirRemoved)
            it.second->saveBlankDir(filelist, version, it.first.c_str(), true);
        it.second->collect(filelist, version);
    }

    for(const auto& it : mFiles)
    {
        switch(it.second.comparetype())
        {
        case dPatcher::CT_Same:
            if(mRefPair)
            DD_hook(mRefPair->files())
            {
                auto PairFile = DD_fish.find(it.first);
                if(PairFile != DD_fish.end())
                    PairFile->second.save(filelist, version, it.first.c_str());
            }
            break;
        case dPatcher::CT_Added:
            it.second.save(filelist, version, it.first.c_str());
            break;
        case dPatcher::CT_Removed:
            if(mRefPair)
            DD_hook(mRefPair->files())
            {
                auto PairFile = DD_fish.find(it.first);
                if(PairFile != DD_fish.end())
                    PairFile->second.saveForRemoved(filelist, version, it.first.c_str());
            }
            break;
        case dPatcher::CT_Different:
            it.second.save(filelist, version, it.first.c_str());
            break;
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ ScheduleP
class ScheduleP : public dEscaper
{
public:
    virtual char typecode() const {return 'N';}
    virtual dPatcher::vercode version() const {return 0;}
    virtual dBinary build() const {return dBinary();}

public:
    static ScheduleP* toClass(ptr_u handle)
    {
        return (ScheduleP*) handle;
    }

DD_escaper(ScheduleP, dEscaper):
    void _init_(InitType type)
    {
    }
    void _quit_()
    {
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ DownloadScheduleP
class DownloadScheduleP : public ScheduleP
{
public:
    char typecode() const override {return 'D';}
    dPatcher::vercode version() const override {return mVersion;}
    dBinary build() const override;

DD_escaper(DownloadScheduleP, ScheduleP, mVersion(0)):
    void _init_(InitType type)
    {
        _super_::_init_(type);
    }
    void _quit_()
    {
        _super_::_quit_();
    }
    const dPatcher::vercode mVersion;

public:
    DD_passage_declare(DownloadScheduleP, const DirDataP& io);
};

dBinary DownloadScheduleP::build() const
{
    return dBinary();
}

DD_passage_define(DownloadScheduleP, const DirDataP& io), mVersion(0)
{
    _init_(InitType::Create);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ UploadScheduleP
class UploadScheduleP : public ScheduleP
{
public:
    char typecode() const override {return 'U';}
    dPatcher::vercode version() const override {return mVersion;}
    dBinary build() const override;

DD_escaper(UploadScheduleP, ScheduleP, mVersion(0)):
    void _init_(InitType type)
    {
        _super_::_init_(type);
    }
    void _quit_()
    {
        _super_::_quit_();
    }
    const dPatcher::vercode mVersion;
    dMarkup mFileList;

public:
    DD_passage_declare(UploadScheduleP, const DirDataP& local, dPatcher::vercode version);
};

dBinary UploadScheduleP::build() const
{
    return mFileList.saveYaml().toBinaryUTF8(false);
}

DD_passage_define(UploadScheduleP, const DirDataP& local, dPatcher::vercode version), mVersion(version + 1)
{
    _init_(InitType::Create);

    mFileList.at("note").at("uploader-id").set("people2");
    mFileList.at("note").at("uploader-ip").set("240.100.100.1");
    mFileList.at("note").at("upload-begin").set("2021-10-15T13:20:02Z");
    mFileList.at("note").at("upload-end").set("2021-10-15T13:20:02Z");
    mFileList.at("note").at("upload-try").set("1");
    local.collect(mFileList.at("file"), mVersion);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dPatcher
void dPatcher::setGroupGetter(IOGetGroupNameCB getter)
{
    mGroupGetter = getter;
}

void dPatcher::setGroupSetter(IOSetGroupFocusCB getter)
{
    mGroupSetter = getter;
}

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

uint32_t dPatcher::getGroupCount()
{
    for(uint32_t i = 0; true; ++i)
        if(mGroupGetter(i).length() == 0)
            return i;
    return 0;
}

dString dPatcher::getGroupName(uint32_t index)
{
    const dString GroupName = mGroupGetter(index);
    return GroupName.clone(0, GroupName.length() - 1); // -1은 슬래시기호
}

void dPatcher::setGroupFocusing(dLiteral groupname)
{
    mGroupSetter(groupname);
}

dPatcher::vercode dPatcher::searchLatestVersion(vercode startversion) const
{
    ////////////////////////////////////////////////////////
    return 0; /////
}

dPatcher::IOData dPatcher::readyForDownload(vercode version) const
{
    const dMarkup HashYaml(dString::fromBinaryUTF8(mReader(version, DT_TotalHash, "filelist.txt")));

    auto NewIODirData = new IODirDataP(version, false);
    NewIODirData->load(HashYaml);
    return dPatcher::IOData((ptr_u)(GUIDataP*) NewIODirData,
        [](ptr_u handle)->void {delete (GUIDataP*) handle;});
}

dPatcher::IOData dPatcher::readyForUpload(vercode startversion, vercode* getversion) const
{
    const vercode LatestVersion = searchLatestVersion(startversion);
    const dMarkup HashYaml(dString::fromBinaryUTF8(mReader(LatestVersion, DT_TotalHash, "filelist.txt")));
    if(getversion) *getversion = LatestVersion;

    auto NewIODirData = new IODirDataP(LatestVersion, true);
    NewIODirData->load(HashYaml);
    return dPatcher::IOData((ptr_u)(GUIDataP*) NewIODirData,
        [](ptr_u handle)->void {delete (GUIDataP*) handle;});
}

dPatcher::LocalData dPatcher::readyForLocal(dLiteral dirpath)
{
    auto NewLocalDirData = new LocalDirDataP();
    NewLocalDirData->load(dirpath, dirpath.length());
    return dPatcher::LocalData((ptr_u)(GUIDataP*) NewLocalDirData,
        [](ptr_u handle)->void {delete (GUIDataP*) handle;});
}

bool dPatcher::compare(IOData io, LocalData local)
{
    if(auto CurIO = io.get<DirDataP>())
    if(auto CurLocal = local.get<DirDataP>())
        return DirDataP::compare(*CurIO, *CurLocal);
    return false;
}

dPatcher::Schedule dPatcher::build(IOData io, LocalData local, dLiteral memo)
{
    GUIDataP::MEMO() = memo;
    if(auto CurIO = io.get<DirDataP>())
    if(auto CurLocal = local.get<DirDataP>())
    {
        if(((IODirDataP*) CurIO)->upload())
        {
            auto Version = ((IODirDataP*) CurIO)->version();
            auto NewUploadSchedule = new UploadScheduleP(*CurLocal, Version);
            return dPatcher::Schedule((ptr_u)(ScheduleP*) NewUploadSchedule,
                [](ptr_u handle)->void {delete (ScheduleP*) handle;});
        }
        else
        {
            auto NewDownloadSchedule = new DownloadScheduleP(*CurIO);
            return dPatcher::Schedule((ptr_u)(ScheduleP*) NewDownloadSchedule,
                [](ptr_u handle)->void {delete (ScheduleP*) handle;});
        }
    }
    return dPatcher::Schedule((ptr_u) new ScheduleP(),
        [](ptr_u handle)->void {delete (ScheduleP*) handle;});
}

bool dPatcher::driveOnce(Schedule schedule, uint32_t msec) const
{
    return true; /////
}

dPatcher::Schedule dPatcher::load(dLiteral filepath)
{
    return dPatcher::Schedule(); /////
}

bool dPatcher::save(const Schedule& schedule, dLiteral filepath)
{
    if(auto CurSchedule = schedule.get<ScheduleP>())
    {
        const dString FilePath = dString::print("dpatcher/schedule/%.*s", filepath.length(), filepath.string());
        return CurSchedule->build().toFile(FilePath, true);
    }
    return false;
}

dPatcher::worktype dPatcher::getType(const Schedule& schedule)
{
    if(auto CurSchedule = schedule.get<ScheduleP>())
    {
        if(CurSchedule->typecode() == 'N')
            return WT_NoWork;
        else if(CurSchedule->typecode() == 'D')
            return WT_Download;
        else if(CurSchedule->typecode() == 'U')
            return WT_Upload;
    }
    return WT_NoWork;
}

dPatcher::vercode dPatcher::getVersion(const Schedule& schedule)
{
    if(auto CurSchedule = schedule.get<ScheduleP>())
        return CurSchedule->version();
    return 0;
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
        DD_global_direct(std::vector<dString>, gGroups);
        DD_global_direct(dString, gFocusedGroup);

        mGroupGetter = [](uint32_t index)->dString
        {
            if(gGroups.size() == 0)
            {
                const dDirectory Directory("dpatcher/");
                for(const auto& it : Directory.dirs())
                {
                    const dString FirstFilePath = ("dpatcher/" + it.first + "p000/r000z_filelist.txt").c_str();
                    if(0 < dBinary::fromFile(FirstFilePath).length())
                        gGroups.push_back(it.first.c_str());
                }
            }
            if(index < gGroups.size())
                return gGroups[index];
            return "";
        };

        mGroupSetter = [](dString groupname)->void
        {
            gFocusedGroup = groupname + '/';
        };

        mReader = [](vercode version, datatype type, dLiteral dataname)->dBinary
        {
            const uint32_t HiNumber = version / 1000;
            const uint32_t LoNumber = version % 1000;
            const dString FilePath = dString::print("dpatcher/%.*sp%03u/r%03u%c_%.*s", gFocusedGroup.length(), gFocusedGroup.string(),
                HiNumber, LoNumber, type, dataname.length(), dataname.string());
            return dBinary::fromFile(FilePath);
        };

        mWriter = [](vercode version, datatype type, dLiteral dataname, const dBinary& data)->bool
        {
            const uint32_t HiNumber = version / 1000;
            const uint32_t LoNumber = version % 1000;
            const dString FilePath = dString::print("dpatcher/%.*sp%03u/r%03u%c_%.*s", gFocusedGroup.length(), gFocusedGroup.string(),
                HiNumber, LoNumber, type, dataname.length(), dataname.string());
            return data.toFile(FilePath, true);
        };

        mLogger = [](steptype type, float progress, dLiteral detail)->void
        {
            switch(type)
            {
            case ST_CheckingForDownload:
                printf("Checking[%d%%] %.*s", int(progress * 100 + 0.5), detail.length(), detail.string());
                break;
            case ST_CleaningForDownload:
                printf("Cleaning[%d%%] %.*s", int(progress * 100 + 0.5), detail.length(), detail.string());
                break;
            case ST_Downloading:
                printf("Downloading[%d%%] %.*s", int(progress * 100 + 0.5), detail.length(), detail.string());
                break;
            case ST_CopyingForUpload:
                printf("Copying[%d%%] %.*s", int(progress * 100 + 0.5), detail.length(), detail.string());
                break;
            case ST_Uploading:
                printf("Uploading[%d%%] %.*s", int(progress * 100 + 0.5), detail.length(), detail.string());
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
    mGroupGetter = DD_rvalue(rhs.mGroupGetter);
    mGroupSetter = DD_rvalue(rhs.mGroupSetter);
    mReader = DD_rvalue(rhs.mReader);
    mWriter = DD_rvalue(rhs.mWriter);
    mLogger = DD_rvalue(rhs.mLogger);
}

void dPatcher::_copy_(const _self_& rhs)
{
    mGroupGetter = rhs.mGroupGetter;
    mGroupSetter = rhs.mGroupSetter;
    mReader = rhs.mReader;
    mWriter = rhs.mWriter;
    mLogger = rhs.mLogger;
}

DD_passage_define_alone(dPatcher, IOGetGroupNameCB getter, IOSetGroupFocusCB setter, IOReadCB reader, IOWriteCB writer, LogCB logger)
{
    mGroupGetter = getter;
    mGroupSetter = setter;
    mReader = reader;
    mWriter = writer;
    mLogger = logger;
}

} // namespace Daddy
