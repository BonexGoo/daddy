/// @brief     Definition of string class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_string.hpp"

// Dependencies
#include "dd_binary.hpp"
#include <cstring>
#include <stdarg.h>
#include <unordered_set>
#include <locale.h>
#if DD_OS_WINDOWS
    #include <windows.h>
#endif

// https://docs.microsoft.com/ko-kr/cpp/c-language/type-double?view=vs-2019
#define DBL_MAX_BIAS 308

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ StringAgentP
class StringAgentP
{
private:
    enum {LiteralsRefCount = 0x40000000};

public:
    void attach() const;
    void detach() const;
    void literalToVariable();

public:
    inline utf8s_nn string() const {return mString;}
    inline uint32_t length() const {return mLength;}
    utf8 operator[](int32_t index) const;

public:
    void debugPrint() const;

private:
    template <bool ValidLength>
    uint32_t getLengthAndHashing(int32_t length);

public:
    class Hasher
    {
    public: 
        size_t operator()(const StringAgentP& self) const
        {return self.mHash;}
    };
    bool operator==(const StringAgentP& rhs) const
    {
        if(std::strncmp(mString, rhs.mString, (mLength < rhs.mLength)? mLength : rhs.mLength))
            return false;
        return (mLength == rhs.mLength);
    }

DD_escaper_alone(StringAgentP):
    void _init_(InitType type)
    {
        mDependency = nullptr;
        mString = nullptr;
        mLength = 0;
        mHash = 0;
        mRefCount = 1;
    }
    void _quit_()
    {
        if(mDependency)
            mDependency->detach();
        else if(mRefCount < LiteralsRefCount)
            delete[] mString;
    }
    void _move_(_self_&& rhs)
    {
        mDependency = rhs.mDependency;
        mString = rhs.mString;
        mLength = rhs.mLength;
        mHash = rhs.mHash;
        mRefCount = rhs.mRefCount;
    }
    void _copy_(const _self_& rhs)
    {
        DD_assert(false, "you have called an unused method.");
    }
    const StringAgentP* mDependency;
    utf8s_nn mString;
    uint32_t mLength;
    size_t mHash;
    mutable int32_t mRefCount;

public:
    DD_passage_alone(StringAgentP, utf8s_nn literal, int32_t length)
    {
        DD_assert(-1 <= length, "the index has exceeded the array limit.");
        _init_(InitType::Create);

        mString = literal;
        if(length == -1)
            mLength = getLengthAndHashing<false>(length);
        else mLength = getLengthAndHashing<true>(length);
        mRefCount = LiteralsRefCount + 1;
    }
    DD_passage_alone(StringAgentP, ptr_u buffer, int32_t length)
    {
        DD_assert(-1 <= length, "the index has exceeded the array limit.");
        _init_(InitType::Create);

        mString = *((utf8s*) &buffer);
        if(length == -1)
            mLength = getLengthAndHashing<false>(length);
        else mLength = getLengthAndHashing<true>(length);
    }
    DD_passage_alone(StringAgentP, const StringAgentP& agent, int32_t index, int32_t length)
    {
        DD_assert(0 <= index && -1 <= length, "the index has exceeded the array limit.");
        DD_assert(index + length <= (int32_t) agent.mLength, "the index has exceeded the array limit.");
        _init_(InitType::Create);

        mDependency = &agent;
        if(auto ParentDependency = mDependency->mDependency)
            mDependency = ParentDependency;
        mDependency->attach();

        mString = agent.mString + index;
        if(length == -1)
            mLength = getLengthAndHashing<false>(length);
        else mLength = getLengthAndHashing<true>(length);
    }
    DD_passage_alone(StringAgentP, const dLiteral& front, const dLiteral& rear)
    {
        _init_(InitType::Create);

        const int32_t NewLength = front.length() + rear.length();
        utf8* NewPtr = new utf8[NewLength];
        std::memcpy(NewPtr, front.string(), front.length());
        std::memcpy(NewPtr + front.length(), rear.string(), rear.length());
        mString = NewPtr;
        mLength = getLengthAndHashing<true>(NewLength);
    }
    DD_passage_alone(StringAgentP, const dLiteral& front, utf8s_nn rear, int32_t length)
    {
        DD_assert(-1 <= length, "the index has exceeded the array limit.");
        _init_(InitType::Create);
        if(length == -1)
            length = (int32_t) strlen(rear);

        const int32_t NewLength = front.length() + length;
        utf8* NewPtr = new utf8[NewLength];
        std::memcpy(NewPtr, front.string(), front.length());
        std::memcpy(NewPtr + front.length(), rear, length);
        mString = NewPtr;
        mLength = getLengthAndHashing<true>(NewLength);
    }
    DD_passage_alone(StringAgentP, utf8s_nn front, int32_t length, const dLiteral& rear)
    {
        DD_assert(-1 <= length, "the index has exceeded the array limit.");
        _init_(InitType::Create);
        if(length == -1)
            length = (int32_t) strlen(front);

        const int32_t NewLength = length + rear.length();
        utf8* NewPtr = new utf8[NewLength];
        std::memcpy(NewPtr, front, length);
        std::memcpy(NewPtr + length, rear.string(), rear.length());
        mString = NewPtr;
        mLength = getLengthAndHashing<true>(NewLength);
    }
};

typedef std::unordered_set<StringAgentP, StringAgentP::Hasher> StringAgentSet;
DD_global("gStringPool", StringAgentSet, gStringPool);

void StringAgentP::attach() const
{
    mRefCount++;
}

void StringAgentP::detach() const
{
    if((--mRefCount & ~LiteralsRefCount) == 0)
        gStringPool.erase(*this);
}

void StringAgentP::literalToVariable()
{
    DD_assert(mRefCount == LiteralsRefCount + 1, "you have called a method at the wrong timing.");
    utf8* NewPtr = new utf8[mLength];
    std::memcpy(NewPtr, mString, mLength);
    mString = NewPtr;
    mRefCount = 1;
}

utf8 StringAgentP::operator[](int32_t index) const
{
    DD_assert(0 <= index && index < (int32_t) mLength, "the index has exceeded the array limit.");
    return mString[index];
}

void StringAgentP::debugPrint() const
{
    printf(
        #if DD_BUILD_X64
            #if DD_OS_WINDOWS
                "%c[0x%016llx] "
            #elif DD_OS_LINUX
                "%c[0x%016lx] "
            #endif
        #else
            "%c[0x%08x] "
        #endif
        "\"%.*s\" <%d>\n",
            (mDependency)? '=' : (mRefCount < LiteralsRefCount)? '+' : '-', DD_ptr_to_num(mString),
            mLength, mString, (mRefCount < LiteralsRefCount)? mRefCount : mRefCount - LiteralsRefCount);
}

template <bool ValidLength>
uint32_t StringAgentP::getLengthAndHashing(int32_t length)
{
    utf8s_nn Ptr = mString;
    utf8s_nn PtrEnd = mString + length;
    mHash = 5381; // djb2-hash = hash * 33 + code
    while((ValidLength)? Ptr < PtrEnd : *Ptr)
        mHash = ((mHash << 5) + mHash) + *(Ptr++);
    return (ValidLength)? uint32_t(length) : uint32_t(Ptr - mString);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dLiteral
utf8s dLiteral::buildNative() const
{
    if(mString[mLength] == '\0')
        return mString;
    if(!mNative)
    {
        mNative = new utf8[mLength + 1];
        std::memcpy((void*) mNative, mString, mLength);
        mNative[mLength] = '\0';
    }
    return mNative;
}

dLiteral::dLiteral(StringAgentP& agent)
    : mString(agent.string()), mLength(agent.length()), mRefAgent(&agent)
{
    mRefAgent->attach();
    mNative = nullptr;
}

dLiteral::dLiteral(const dLiteral& rhs)
    : mString(rhs.mString), mLength(rhs.mLength), mRefAgent(rhs.mRefAgent)
{
    if(mRefAgent)
        mRefAgent->attach();
    mNative = nullptr;
}

dLiteral::~dLiteral()
{
    if(mRefAgent)
        mRefAgent->detach();
    delete[] mNative;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dString
void dString::clear()
{
    _quit_();
    _init_(InitType::Create);
}

utf8s_nn dString::string() const
{
    return mRefAgent->string();
}

uint32_t dString::length() const
{
    return mRefAgent->length();
}

dString dString::clone(int32_t index, int32_t length) const
{
    if(length == -1)
        return dString(*this, index, mRefAgent->length() - index);
    return dString(*this, index, length);
}

dString& dString::reset(const dLiteral& string)
{
    mRefAgent->detach();
    if(string.mRefAgent)
        (mRefAgent = string.mRefAgent)->attach();
    else
    {
        auto Result = gStringPool.insert(StringAgentP(string.string(), string.length()));
        mRefAgent = (StringAgentP*) &(*Result.first);
        if(!Result.second)
            mRefAgent->attach(); // if the pool fails to expand, attach the old string.
    }
    return *this;
}

dString& dString::reset(utf8s_nn string, int32_t length)
{
    mRefAgent->detach();
    auto Result = gStringPool.insert(StringAgentP(string, length));
    mRefAgent = (StringAgentP*) &(*Result.first);
    if(!Result.second)
        mRefAgent->attach(); // if the pool fails to expand, attach the old string.
    else mRefAgent->literalToVariable(); // if the creation is successful, change it to variable.
    return *this;
}

dString& dString::add(const dLiteral& string)
{
    auto Result = gStringPool.insert(StringAgentP(operator dLiteral(), string));
    mRefAgent->detach(); // 자기 자신을 사용하므로 gStringPool->insert이후 detach
    mRefAgent = (StringAgentP*) &(*Result.first);
    if(!Result.second)
        mRefAgent->attach(); // if the pool fails to expand, attach the old string.
    return *this;
}

dString& dString::add(utf8s_nn string, int32_t length)
{
    auto Result = gStringPool.insert(StringAgentP(operator dLiteral(), string, length));
    mRefAgent->detach(); // 자기 자신을 사용하므로 gStringPool->insert이후 detach
    mRefAgent = (StringAgentP*) &(*Result.first);
    if(!Result.second)
        mRefAgent->attach(); // if the pool fails to expand, attach the old string.
    return *this;
}

dString& dString::add(utf8 code)
{
    auto Result = gStringPool.insert(StringAgentP(operator dLiteral(), &code, 1));
    mRefAgent->detach(); // 자기 자신을 사용하므로 gStringPool->insert이후 detach
    mRefAgent = (StringAgentP*) &(*Result.first);
    if(!Result.second)
        mRefAgent->attach(); // if the pool fails to expand, attach the old string.
    return *this;
}

dString dString::trimSpace() const
{
    utf8s_nn Src = mRefAgent->string();
    int32_t IndexBegin = 0;
    int32_t IndexEnd = length();
    while(IndexBegin < IndexEnd && Src[IndexBegin] == ' ') IndexBegin++;
    while(IndexBegin < IndexEnd && Src[IndexEnd - 1] == ' ') IndexEnd--;
    return dString(*this, IndexBegin, IndexEnd - IndexBegin);
}

dString dString::trimQuote() const
{
    utf8s_nn Src = mRefAgent->string();
    if(2 <= length())
    if(*Src == '\"' || *Src == '\'')
    if(*Src == *(Src + length() - 1))
        return dString(*this, 1, length() - 2);
    return *this;
}

dString::operator dLiteral() const
{
    return dLiteral(*mRefAgent);
}

utf8 dString::operator[](int32_t index) const
{
    return (*mRefAgent)[index];
}

bool dString::operator==(const dString& rhs) const
{
    return (mRefAgent == rhs.mRefAgent);
}

bool dString::operator!=(const dString& rhs) const
{
    return (mRefAgent != rhs.mRefAgent);
}

dString& dString::operator=(const dLiteral& rhs)
{
    return reset(rhs);
}

dString& dString::operator+=(const dLiteral& rhs)
{
    return add(rhs);
}

dString& dString::operator+=(utf8 rhs)
{
    return add(rhs);
}

dString dString::operator+(const dLiteral& rhs) const
{
    auto Result = gStringPool.insert(StringAgentP(operator dLiteral(), rhs));
    if(!Result.second)
        Result.first->attach(); // if the pool fails to expand, attach the old string.
    return dString((StringAgentP*) &(*Result.first));
}

dString dString::operator+(utf8s rhs) const
{
    auto Result = gStringPool.insert(StringAgentP(operator dLiteral(), rhs, -1));
    if(!Result.second)
        Result.first->attach(); // if the pool fails to expand, attach the old string.
    return dString((StringAgentP*) &(*Result.first));
}

dString dString::operator+(utf8 rhs) const
{
    auto Result = gStringPool.insert(StringAgentP(operator dLiteral(), &rhs, 1));
    if(!Result.second)
        Result.first->attach(); // if the pool fails to expand, attach the old string.
    return dString((StringAgentP*) &(*Result.first));
}

dString operator+(utf8s lhs, const dLiteral& rhs)
{
    auto Result = gStringPool.insert(StringAgentP(lhs, -1, rhs));
    if(!Result.second)
        Result.first->attach(); // if the pool fails to expand, attach the old string.
    return dString((StringAgentP*) &(*Result.first));
}

dString operator+(utf8 lhs, const dLiteral& rhs)
{
    auto Result = gStringPool.insert(StringAgentP(&lhs, 1, rhs));
    if(!Result.second)
        Result.first->attach(); // if the pool fails to expand, attach the old string.
    return dString((StringAgentP*) &(*Result.first));
}

dString dString::print(utf8s format, ...)
{
    utf8* Result = nullptr;
    va_list Args;
    va_start(Args, format);
    #if DD_OS_WINDOWS
        const auto ResultSize = vsnprintf(nullptr, 0, format, Args);
        if(0 < ResultSize)
        {
            Result = new utf8[ResultSize + 1];
            vsnprintf(Result, ResultSize + 1, format, Args);
        }
    #else
        const auto ResultSize = vasprintf(&Result, format, Args);
    #endif
    va_end(Args);

    if(0 < ResultSize)
        return dString(*((ptr_u*) &Result), ResultSize);
    else if(ResultSize < 0)
        DD_assert(false, "vsnprintf failed to parse the format.");
    return dString();
}

dString dString::fromNumber(int64_t value)
{
    utf8 Result[1024];
    auto Length = std::snprintf(Result, 1024, "%lld", (long long int) value);
    return dString(Result, Length);
}

dString dString::fromDouble(double value)
{
    utf8 Result[1024];
    auto Length = std::snprintf(Result, 1024, "%lf", value);
    while(Result[Length - 1] == '0') Length--;
    if(Result[Length - 1] == '.') Length--;
    return dString(Result, Length);
}

dString dString::fromBinaryUTF8(dBinary binary)
{
    int32_t DumpLength = binary.length() / sizeof(utf8);
    auto DumpPtr = (utf8s_nn) binary.buffer();
    if(DumpPtr[DumpLength - 1] == '\0')
        DumpLength--;
    return dString((ptr_u) DumpPtr, DumpLength);
}

dString dString::fromBinaryUTF16(dBinary binary)
{
    int32_t DumpLengthW = binary.length() / sizeof(ucode);
    auto DumpPtrW = (ucodes_nn) binary.buffer();
    if(DumpPtrW[DumpLengthW - 1] == L'\0')
        DumpLengthW--;

    #if DD_OS_WINDOWS
        auto DumpLengthA = WideCharToMultiByte(CP_UTF8, 0, DumpPtrW, DumpLengthW, NULL, 0, 0, 0);
        auto DumpPtrA = new utf8[DumpLengthA];
        WideCharToMultiByte(CP_UTF8, 0, DumpPtrW, DumpLengthW, DumpPtrA, DumpLengthA, 0, 0);
        return dString((ptr_u) DumpPtrA, DumpLengthA);
    #else
        #error [daddy] this platform is not ready!
    return dString();
    #endif
}

static int64_t StringToNumber(utf8s_nn focus, const utf8s_nn end)
{
    if(focus == end)
        return 0;

    const bool IsMinus = (*focus == '-');
    if(!IsMinus && *focus != '+') focus--;

    int64_t Result = 0;
    while(++focus < end && '0' <= *focus && *focus <= '9')
        Result = Result * 10 + *focus - '0';
    return (IsMinus)? -Result : Result;
}

int64_t dString::toNumber() const
{
    utf8s_nn Focus = mRefAgent->string();
    const utf8s_nn End = Focus + mRefAgent->length();
    return StringToNumber(Focus, End);
}

static double StringToDouble(utf8s_nn focus, const utf8s_nn end)
{
    if(focus == end)
        return 0;

    const bool IsMinus = (*focus == '-');
    if(!IsMinus && *focus != '+') focus--;

    int64_t Value = 0;
    while(++focus < end && '0' <= *focus && *focus <= '9')
        Value = Value * 10 + *focus - '0';

    double Decimal = 0;
    if(*focus == '.')
    {
        int64_t Level = 1;
        while(++focus < end && '0' <= *focus && *focus <= '9')
            Decimal += (*focus - (int64_t) '0') / (double) (Level *= 10);
    }

    const double Result = (IsMinus)? -(Value + Decimal) : (Value + Decimal);
    if(*focus == 'E' || *focus == 'e')
    {
        static const double* gECodeEM = []()->const double* {static double _[DBL_MAX_BIAS]; double EM = 10; for(int i = 0; i < DBL_MAX_BIAS; ++i) _[i] = (EM /= 10); return _;}();
        static const double* gECodeEP = []()->const double* {static double _[DBL_MAX_BIAS]; double EP = 1; for(int i = 0; i < DBL_MAX_BIAS; ++i) _[i] = (EP *= 10); return _;}();
        const int64_t EValue = StringToNumber(++focus, end);
        if(0 < EValue)
            return Result * gECodeEP[EValue - 1];
        else return Result * gECodeEM[-EValue];
    }
    return Result;
}

double dString::toDouble() const
{
    utf8s_nn Focus = mRefAgent->string();
    const utf8s_nn End = Focus + mRefAgent->length();
    return StringToDouble(Focus, End);
}

dBinary dString::toBinaryUTF8(bool endmark) const
{
    dBinary Collector;
    Collector.add((dumps) mRefAgent->string(), mRefAgent->length());
    if(endmark) Collector.add((dumps) "\0", sizeof(utf8));
    return Collector;
}

dBinary dString::toBinaryUTF16(bool endmark) const
{
    dBinary Collector;
    #if DD_OS_WINDOWS
        auto DumpLengthW = MultiByteToWideChar(CP_UTF8, 0, mRefAgent->string(), mRefAgent->length(), NULL, 0);
        if(auto DumpPtrW = new ucode[DumpLengthW])
        {
            MultiByteToWideChar(CP_UTF8, 0, mRefAgent->string(), mRefAgent->length(), DumpPtrW, DumpLengthW);
            Collector.add((dumps) DumpPtrW, DumpLengthW * sizeof(ucode));
            delete[] DumpPtrW;
        }
    #else
        #error [daddy] this platform is not ready!
    #endif
    if(endmark) Collector.add((dumps) L"\0", sizeof(ucode));
    return Collector;
}

void dString::debugPrint() const
{
    mRefAgent->debugPrint();
}

void dString::debugPrintAll()
{
    for(auto& it : gStringPool)
        it.debugPrint();
}

const dString& dString::blank()
{DD_global_direct(dString, _, dLiteral("")); return _;}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dString::escaper
void dString::_init_(InitType type)
{
    if(type == InitType::Create)
        (mRefAgent = blank().mRefAgent)->attach();
    else mRefAgent = nullptr;
}

void dString::_quit_()
{
    if(mRefAgent)
        mRefAgent->detach();
}

void dString::_move_(_self_&& rhs)
{
    mRefAgent = rhs.mRefAgent;
}

void dString::_copy_(const _self_& rhs)
{
    (mRefAgent = rhs.mRefAgent)->attach();
}

DD_passage_define_alone(dString, const dLiteral& string)
{
    if(string.mRefAgent)
        (mRefAgent = string.mRefAgent)->attach();
    else
    {
        auto Result = gStringPool.insert(StringAgentP(string.string(), string.length()));
        mRefAgent = (StringAgentP*) &(*Result.first);
        if(!Result.second)
            mRefAgent->attach(); // if the pool fails to expand, attach the old string.
    }
}

DD_passage_define_alone(dString, utf8s_nn string, int32_t length)
{
    auto Result = gStringPool.insert(StringAgentP(string, length)); // temporarily created with literals.
    mRefAgent = (StringAgentP*) &(*Result.first);
    if(!Result.second)
        mRefAgent->attach(); // if the pool fails to expand, attach the old string.
    else mRefAgent->literalToVariable(); // if the creation is successful, change it to variable.
}

DD_passage_define_alone(dString, StringAgentP* agent)
{
    (mRefAgent = agent)->attach();
}

DD_passage_define_alone(dString, ptr_u buffer, int32_t length)
{
    auto Result = gStringPool.insert(StringAgentP(buffer, length));
    mRefAgent = (StringAgentP*) &(*Result.first);
    if(!Result.second)
        mRefAgent->attach(); // if the pool fails to expand, attach the old string.
}

DD_passage_define_alone(dString, const dString& string, int32_t index, int32_t length)
{
    auto Result = gStringPool.insert(StringAgentP(*string.mRefAgent, index, length));
    mRefAgent = (StringAgentP*) &(*Result.first);
    if(!Result.second)
        mRefAgent->attach(); // if the pool fails to expand, attach the old string.
}

} // namespace Daddy
