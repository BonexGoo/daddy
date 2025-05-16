/// @brief     Definition of binary class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_binary.hpp"

// Dependencies
#include "dd_string.hpp"
#include <cstring>
#include <locale.h>
#include <direct.h>

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ BinaryAgentP
class BinaryAgentP
{
public:
    void attach() const;
    void detach() const;
    BinaryAgentP* add(dumps binary, uint32_t length);

public:
    inline dumps buffer() const {return mBuffer;}
    inline uint32_t length() const {return mWrittenLength;}
    dump operator[](int32_t index) const;

DD_escaper_alone(BinaryAgentP):
    void _init_(InitType type)
    {
        mBuffer = nullptr;
        mWrittenLength = 0;
        mWholeLength = 0;
        mRefCount = 1;
    }
    void _quit_()
    {
        DD_assert(mRefCount == 0 || mRefCount == 1 || mRefCount == 2,
            "reference count does not match."); // fromExternal는 mRefCount가 2
        if(mRefCount == 1)
            delete[] mBuffer;
    }
    void _move_(_self_&& rhs)
    {
        mBuffer = DD_rvalue(rhs.mBuffer);
        mWrittenLength = DD_rvalue(rhs.mWrittenLength);
        mWholeLength = DD_rvalue(rhs.mWholeLength);
        mRefCount = DD_rvalue(rhs.mRefCount);
    }
    void _copy_(const _self_& rhs)
    {
        DD_assert(false, "you have called an unused method.");
    }
    dump* mBuffer;
    uint32_t mWrittenLength;
    uint32_t mWholeLength;
    mutable int32_t mRefCount;

public:
    DD_passage_alone(BinaryAgentP, dump* buffer, uint32_t written, uint32_t whole)
    {
        _init_(InitType::Create);

        mBuffer = buffer;
        mWrittenLength = written;
        mWholeLength = whole;
    }
};

void BinaryAgentP::attach() const
{
    mRefCount++;
}

void BinaryAgentP::detach() const
{
    if(--mRefCount == 0)
        delete this;
}

BinaryAgentP* BinaryAgentP::add(dumps buffer, uint32_t length)
{
    if(1 < mRefCount || mWholeLength - mWrittenLength < length) // 분리 또는 용량부족
    {
        const uint32_t NewWrittenLength = mWrittenLength + length;
        uint32_t NewWholeLength = 1;
        while(NewWholeLength < NewWrittenLength)
            NewWholeLength <<= 1; // 2의 승수

        dump* NewBuffer = new dump[NewWholeLength];
        std::memcpy(NewBuffer, mBuffer, mWrittenLength);
        std::memcpy(&NewBuffer[mWrittenLength], buffer, length);
        return new BinaryAgentP(NewBuffer, NewWrittenLength, NewWholeLength);
    }

    std::memcpy(&mBuffer[mWrittenLength], buffer, length);
    mWrittenLength += length;
    attach();
    return this;
}

dump BinaryAgentP::operator[](int32_t index) const
{
    DD_assert(0 <= index && index < (int32_t) mWrittenLength, "the index has exceeded the array limit.");
    return mBuffer[index];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dBinary
void dBinary::clear()
{
    _quit_();
    _init_(InitType::Create);
}

dumps dBinary::buffer() const
{
    return mRefAgent->buffer();
}

uint32_t dBinary::length() const
{
    return mRefAgent->length();
}

dBinary& dBinary::add(dumps buffer, uint32_t length)
{
    auto* OldRefAgent = mRefAgent;
    mRefAgent = mRefAgent->add(buffer, length);
    OldRefAgent->detach();
    return *this;
}

dump dBinary::operator[](int32_t index) const
{
    return (*mRefAgent)[index];
}

dBinary& dBinary::operator+=(const dBinary& rhs)
{
    return add(rhs.buffer(), rhs.length());
}

dBinary dBinary::fromInternal(dump* buffer, uint32_t length)
{
    return dBinary(buffer, length);
}

dBinary dBinary::fromExternal(dumps buffer, uint32_t length)
{
    dBinary Result(*((dump**) &buffer), length);
    Result.mRefAgent->attach(); // buffer가 삭제되지 않도록 오버레퍼런스
    return Result;
}

dBinary dBinary::fromFile(const dLiteral& filepath)
{
    dString OldLocale = setlocale(LC_ALL, nullptr);
    setlocale(LC_ALL, "en_US.UTF-8");
    FILE* NewFile = fopen(filepath.buildNative(), "rb");
    setlocale(LC_ALL, ((dLiteral) OldLocale).buildNative());

    if(NewFile)
    {
        fseek(NewFile, 0, SEEK_END);
        auto NewLength = (const int32_t) ftell(NewFile);
        fseek(NewFile, 0, SEEK_SET);

        dump* NewBuffer = new dump[NewLength];
        fread(NewBuffer, sizeof(dump), NewLength, NewFile);
        fclose(NewFile);
        return dBinary(NewBuffer, NewLength);
    }
    return dBinary();
}

bool dBinary::toFile(const dLiteral& filepath, bool autodir) const
{
    dString OldLocale = setlocale(LC_ALL, nullptr);
    setlocale(LC_ALL, "en_US.UTF-8");
    FILE* NewFile = fopen(filepath.buildNative(), "wb");
    setlocale(LC_ALL, ((dLiteral) OldLocale).buildNative());

    if(NewFile)
    {
        fwrite(buffer(), sizeof(dump), length(), NewFile);
        fclose(NewFile);
        return true;
    }
    else if(autodir)
    {
        dString DirName;
        for(utf8s iWord = filepath.buildNative(); *iWord; ++iWord)
        {
            if(*iWord == '/' || *iWord == '\\')
            {
                dLiteral DirPath = DirName;
                _mkdir(DirPath.buildNative());
                DirName += '/';
            }
            else DirName += *iWord;
        }
        return toFile(filepath, false);
    }
    return false;
}

const dBinary& dBinary::blank()
{DD_global_direct(dBinary, _, new dump[4]{0, 0, 0, 0}, 0); return _;}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dBinary::escaper
void dBinary::_init_(InitType type)
{
    if(type == InitType::Create)
        (mRefAgent = blank().mRefAgent)->attach();
    else mRefAgent = nullptr;
}

void dBinary::_quit_()
{
    if(mRefAgent)
        mRefAgent->detach();
}

void dBinary::_move_(_self_&& rhs)
{
    mRefAgent = rhs.mRefAgent;
}

void dBinary::_copy_(const _self_& rhs)
{
    (mRefAgent = rhs.mRefAgent)->attach();
}

DD_passage_define_alone(dBinary, dump* buffer, uint32_t length)
{
    mRefAgent = new BinaryAgentP(buffer, length, length);
}

} // namespace Daddy
