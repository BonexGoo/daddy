/// @brief     Definition of patcher class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_patcher.hpp"

// Dependencies
#include "dd_platform.hpp"
#include "dd_zoker.hpp"
#include <map>
#include <string>

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ GUIStatusP
class GUIStatusP : public dEscaper
{
DD_escaper(GUIStatusP, dEscaper):
    void _init_(InitType type)
    {
    }
    void _quit_()
    {
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ FileDataP
class FileDataP : public GUIStatusP
{
public:
    void load(dString name, const dDirectory::FileStatus& status);

DD_escaper(FileDataP, GUIStatusP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
    }
    void _quit_()
    {
         _super_::_quit_();
    }
    dString mName;
    dString mSize;
    dString mHash;
    dString mDate;
};

void FileDataP::load(dString name, const dDirectory::FileStatus& status)
{
    mName = name;
    mSize = dString::print("%llu", status.mFileSize);
    mHash = dString::print("%llu", status.mFileSize);///////////// 여기서부터!!!
    mDate = dString::print("%llu", status.mLastWriteTime);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ IODirDataP
class IODirDataP : public GUIStatusP
{
public:
    void load(const dZokeReader& hash);

DD_escaper(IODirDataP, GUIStatusP):
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

void IODirDataP::load(const dZokeReader& hash)
{
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ LocalDirDataP
class LocalDirDataP : public GUIStatusP
{
public:
    void load(dString dirpath);

DD_escaper(LocalDirDataP, GUIStatusP):
    void _init_(InitType type)
    {
        _super_::_init_(type);
    }
    void _quit_()
    {
        _super_::_quit_();
    }
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
        mFiles[it.first].load(it.first.c_str(), it.second);
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
    return 0; /////
}

dPatcher::IOData dPatcher::readyForDownload(vercode version) const
{
    return dPatcher::IOData(); /////
}

dPatcher::IOData dPatcher::readyForUpload(vercode startversion) const
{
    return dPatcher::IOData(); /////
}

dPatcher::LocalData dPatcher::readyForLocal(dLiteral dirpath)
{
    LocalDirDataP* NewLocalDirData = new LocalDirDataP();
    NewLocalDirData->load(dirpath);
    return dPatcher::LocalData((ptr_u) NewLocalDirData,
        [](ptr_u handle)->void {delete (LocalDirDataP*) handle;});
}

dPatcher::Schedule dPatcher::build(IOData io, LocalData local)
{
    return dPatcher::Schedule(); /////
}

bool dPatcher::drive(Schedule schedule, dLiteral memo) const
{
    dBinary NewBinary;
    NewBinary.add((dumps) memo.string(), memo.length());
    mWriter(0, UploadMemo, "uploader.txt", NewBinary);
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
    return NoWork; /////
}

dPatcher::vercode dPatcher::getVersion(const Schedule& schedule)
{
    return 0; /////
}

dString dPatcher::getMemo(const Schedule& schedule)
{
    return ""; /////
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
            case steptype::CheckingForDownload:
                printf("Checking[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            case steptype::CleaningForDownload:
                printf("Cleaning[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            case steptype::Downloading:
                printf("Downloading[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            case steptype::CopyingForUpload:
                printf("Copying[%d%%] %s", int(progress * 100 + 0.5), detail.buildNative());
                break;
            case steptype::Uploading:
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
