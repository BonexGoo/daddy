/// @brief     Definition of zoker class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_zoker.hpp"

// Dependencies
#include <string.h>

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dZoker
void dZoker::clear()
{
    _quit_();
    _init_(InitType::Create);
}

dZoker& dZoker::operator()(const dLiteral& key)
{
    valid(ZokeType::Nameable);
    return (*mValue.mNameablePtr)[std::string(key.string(), key.length())];
}

dZoker& dZoker::operator[](uint32_t index)
{
    valid(ZokeType::Indexable);
    return (*mValue.mIndexablePtr)[index];
}

dZoker& dZoker::atAdding()
{
    valid(ZokeType::Indexable);
    return (*mValue.mIndexablePtr)[(int) mValue.mIndexablePtr->size()];
}

void dZoker::setString(const dLiteral& value)
{
    valid(ZokeType::String);
    *mValue.mStringPtr = value;
}

void dZoker::setBinary(const dBinary& value)
{
    valid(ZokeType::Binary);
    *mValue.mBinaryPtr = value;
}

void dZoker::setInt8(const int8_t value)
{
    valid(ZokeType::Int8);
    mValue.mInt8 = value;
}

void dZoker::setInt16(const int16_t value)
{
    valid(ZokeType::Int16);
    mValue.mInt16 = value;
}

void dZoker::setInt32(const int32_t value)
{
    valid(ZokeType::Int32);
    mValue.mInt32 = value;
}

void dZoker::setInt64(const int64_t value)
{
    valid(ZokeType::Int64);
    mValue.mInt64 = value;
}

void dZoker::setUint8(const uint8_t value)
{
    valid(ZokeType::Uint8);
    mValue.mUint8 = value;
}

void dZoker::setUint16(const uint16_t value)
{
    valid(ZokeType::Uint16);
    mValue.mUint16 = value;
}

void dZoker::setUint32(const uint32_t value)
{
    valid(ZokeType::Uint32);
    mValue.mUint32 = value;
}

void dZoker::setUint64(const uint64_t value)
{
    valid(ZokeType::Uint64);
    mValue.mUint64 = value;
}

void dZoker::setFloat32(const float value)
{
    valid(ZokeType::Float32);
    mValue.mFloat32 = value;
}

void dZoker::setFloat64(const double value)
{
    valid(ZokeType::Float64);
    mValue.mFloat64 = value;
}

dBinary dZoker::build() const
{
    // 가변길이 정수처리
    auto addVar = [](dBinary& binary, uint32_t value)->void
    {
        bool NeedContinue = true;
        do
        {
            uint8_t OneVar = (value & 0x7F);
            NeedContinue = (0 < (value >>= 7));
            if(NeedContinue) OneVar |= 0x80;
            binary.add((dumps) &OneVar, 1);
        }
        while(NeedContinue);
    };

    dBinary Collector;
    Collector.add((dumps) &mType, 1); // 타입[1]

    // 하위
    if(mType == ZokeType::Nameable || mType == ZokeType::Indexable)
    {
        // 재귀적 수집
        std::map<int, dBinary> ChildCollector;
        uint32_t BinaryLengthSum = 0;
        if(mType == ZokeType::Nameable) // 네임방식
        {
            for(const auto& it : *mValue.mNameablePtr)
            {
                dBinary& ChildBinary = ChildCollector[(int) ChildCollector.size()];
                // key토큰 선행추가
                ChildBinary.add((dumps) it.first.c_str(), uint32_t(it.first.length() + 1)); // 스트링[N]
                // 하위바이너리 수집
                ChildBinary += it.second.build();
                BinaryLengthSum += ChildBinary.length();
            }
        }
        else if(mType == ZokeType::Indexable) // 인덱스방식
        {
            for(const auto& it : *mValue.mIndexablePtr)
            {
                dBinary& ChildBinary = ChildCollector[(int) ChildCollector.size()];
                // 하위바이너리 수집
                ChildBinary = it.second.build();
                BinaryLengthSum += ChildBinary.length();
            }
        }

        // group토큰 선행추가
        addVar(Collector, (uint32_t) ChildCollector.size()); // 자식수량[1+]
        uint8_t JumperSize = 4;
        if(BinaryLengthSum < 0x100) JumperSize = 1;
        else if(BinaryLengthSum < 0x10000) JumperSize = 2;
        else if(BinaryLengthSum < 0x1000000) JumperSize = 3;
        Collector.add((dumps) &JumperSize, 1); // 점퍼규격[1]
        uint32_t Jumper = uint32_t(JumperSize * ChildCollector.size());
        for(const auto& it : ChildCollector)
        {
            Collector.add((dumps) &Jumper, JumperSize); // [점퍼:N]
            Jumper += it.second.length() - JumperSize; // 점퍼 자신의 위치도 점점 뒤로 가니까
        }

        // 하위바이너리 후행추가
        for(const auto& it : ChildCollector)
            Collector += it.second;
    }
    else
    {
        // 자신
        switch(mType)
        {
        case ZokeType::String:
            {
                const uint32_t ValueSize = mValue.mStringPtr->length() + 1;
                addVar(Collector, ValueSize); // 사이즈[1+]
                Collector.add((dumps) mValue.mStringPtr->string(), ValueSize - 1); // 스트링(null문자없음)[N - 1]
                Collector.add((dumps) "", 1); // null문자[1]
            }
            break;
        case ZokeType::Binary:
            {
                const uint32_t ValueSize = mValue.mBinaryPtr->length();
                addVar(Collector, ValueSize); // 사이즈[1+]
                Collector.add(mValue.mBinaryPtr->buffer(), ValueSize); // 바이너리덤프[N]
            }
            break;
        case ZokeType::Int8: Collector.add((dumps) &mValue.mInt8, 1); break; // 정수[1]
        case ZokeType::Int16: Collector.add((dumps) &mValue.mInt16, 2); break; // 정수[2]
        case ZokeType::Int32: Collector.add((dumps) &mValue.mInt32, 4); break; // 정수[4]
        case ZokeType::Int64: Collector.add((dumps) &mValue.mInt64, 8); break; // 정수[8]
        case ZokeType::Uint8: Collector.add((dumps) &mValue.mUint8, 1); break; // 부호없는 정수[1]
        case ZokeType::Uint16: Collector.add((dumps) &mValue.mUint16, 2); break; // 부호없는 정수[2]
        case ZokeType::Uint32: Collector.add((dumps) &mValue.mUint32, 4); break; // 부호없는 정수[4]
        case ZokeType::Uint64: Collector.add((dumps) &mValue.mUint64, 8); break; // 부호없는 정수[8]
        case ZokeType::Float32: Collector.add((dumps) &mValue.mFloat32, 4); break; // 실수[4]
        case ZokeType::Float64: Collector.add((dumps) &mValue.mFloat64, 8); break; // 실수[8]
        default: break;
        }
    }
    return Collector;
}

void dZoker::valid(ZokeType type)
{
    if(mType == ZokeType::Null)
    {
        switch(mType = type)
        {
        case ZokeType::Nameable: mValue.mNameablePtr = new NameableMap(); break;
        case ZokeType::Indexable: mValue.mIndexablePtr = new IndexableMap(); break;
        case ZokeType::String: mValue.mStringPtr = new dString(); break;
        case ZokeType::Binary: mValue.mBinaryPtr = new dBinary(); break;
        default: break;
        }
    }
    else
    {
        DD_assert(mType == type, "this is the source code for changing the type set once.");
        if(mType != type)
        {
            clear();
            valid(type);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dZoker::escaper
void dZoker::_init_(InitType type)
{
    mType = ZokeType::Null;
    mValue.mWhole = 0;
}

void dZoker::_quit_()
{
    switch(mType)
    {
    case ZokeType::Nameable: delete mValue.mNameablePtr; break;
    case ZokeType::Indexable: delete mValue.mIndexablePtr; break;
    case ZokeType::String: delete mValue.mStringPtr; break;
    case ZokeType::Binary: delete mValue.mBinaryPtr; break;
    default: break;
    }
}

void dZoker::_move_(_self_&& rhs)
{
    mType = DD_rvalue(rhs.mType);
    mValue.mWhole = DD_rvalue(rhs.mValue.mWhole);
}

void dZoker::_copy_(const _self_& rhs)
{
    mType = rhs.mType;
    switch(mType)
    {
    case ZokeType::Nameable: mValue.mNameablePtr = new NameableMap(*rhs.mValue.mNameablePtr); break;
    case ZokeType::Indexable: mValue.mIndexablePtr = new IndexableMap(*rhs.mValue.mIndexablePtr); break;
    case ZokeType::String: mValue.mStringPtr = new dString(*rhs.mValue.mStringPtr); break;
    case ZokeType::Binary: mValue.mBinaryPtr = new dBinary(*rhs.mValue.mBinaryPtr); break;
    default: mValue.mWhole = rhs.mValue.mWhole; break;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dZokeReader
bool dZokeReader::isValid() const
{
    return (mBuffer[0] != (dump) ZokeType::Null);
}

uint32_t dZokeReader::length() const
{
    if(mBuffer[0] != (dump) ZokeType::Nameable && mBuffer[0] != (dump) ZokeType::Indexable)
        return 0;

    dumps Temp = &mBuffer[1];
    const uint32_t ChildCount = readVar(Temp);
    return ChildCount;
}

const dZokeReader dZokeReader::operator()(const dLiteral& key) const
{
    if(mBuffer[0] != (dump) ZokeType::Nameable)
        return blank();

    dumps Temp = &mBuffer[1];
    const uint32_t ChildCount = readVar(Temp);
    const uint32_t JumperSize = *(Temp++);
    DD_assert(0 < ChildCount, "ChildCount must be greater than zero.");

    // 이진탐색
    uint32_t Begin = 0, End = ChildCount - 1;
    while(Begin <= End)
    {
        const uint32_t Middle = (Begin + End) / 2;
        dumps CurKey = jumpTo(Temp, Middle, JumperSize);
        const int Compare = strncmp((utf8s) CurKey, key.string(), key.length());
        const bool NullCheck = (CurKey[key.length()] == 0);
        if(Compare == 0)
        {
            if(NullCheck)
                return dZokeReader(mBinary, CurKey + key.length() + 1);
            else End = Middle - 1;
        }
        else if(Compare < 0)
            Begin = Middle + 1;
        else End = Middle - 1;
    }
    return blank();
}

const dZokeReader dZokeReader::operator[](uint32_t index) const
{
    if(mBuffer[0] != (dump) ZokeType::Indexable)
        return blank();

    dumps Temp = &mBuffer[1];
    const uint32_t ChildCount = readVar(Temp);
    const uint32_t JumperSize = *(Temp++);

    if(ChildCount <= index)
        return blank();

    dumps Child = jumpTo(Temp, index, JumperSize);
    return dZokeReader(mBinary, Child);
}

utf8s dZokeReader::getString(utf8s def, uint32_t* size) const
{
    if(mBuffer[0] != (dump) ZokeType::String)
    {
        if(size) *size = 0;
        return def;
    }

    dumps Temp = &mBuffer[1];
    const uint32_t StringSize = readVar(Temp);
    if(size) *size = StringSize; // null포함
    return (utf8s) Temp;
}

dumps dZokeReader::getBinary(dumps def, uint32_t* size) const
{
    if(mBuffer[0] != (dump) ZokeType::Binary)
    {
        if(size) *size = 0;
        return def;
    }

    dumps Temp = &mBuffer[1];
    const uint32_t BinarySize = readVar(Temp);
    if(size) *size = BinarySize;
    return Temp;
}

int8_t dZokeReader::getInt8(const int8_t def) const
{
    if(mBuffer[0] != (dump) ZokeType::Int8)
        return def;
    return *((int8_t*) &mBuffer[1]);
}

int16_t dZokeReader::getInt16(const int16_t def) const
{
    if(mBuffer[0] != (dump) ZokeType::Int16)
        return def;
    return *((int16_t*) &mBuffer[1]);
}

int32_t dZokeReader::getInt32(const int32_t def) const
{
    if(mBuffer[0] != (dump) ZokeType::Int32)
        return def;
    return *((int32_t*) &mBuffer[1]);
}

int64_t dZokeReader::getInt64(const int64_t def) const
{
    if(mBuffer[0] != (dump) ZokeType::Int64)
        return def;
    return *((int64_t*) &mBuffer[1]);
}

uint8_t dZokeReader::getUint8(const uint8_t def) const
{
    if(mBuffer[0] != (dump) ZokeType::Uint8)
        return def;
    return *((uint8_t*) &mBuffer[1]);
}

uint16_t dZokeReader::getUint16(const uint16_t def) const
{
    if(mBuffer[0] != (dump) ZokeType::Uint16)
        return def;
    return *((uint16_t*) &mBuffer[1]);
}

uint32_t dZokeReader::getUint32(const uint32_t def) const
{
    if(mBuffer[0] != (dump) ZokeType::Uint32)
        return def;
    return *((uint32_t*) &mBuffer[1]);
}

uint64_t dZokeReader::getUint64(const uint64_t def) const
{
    if(mBuffer[0] != (dump) ZokeType::Uint64)
        return def;
    return *((uint64_t*) &mBuffer[1]);
}

float dZokeReader::getFloat32(const float def) const
{
    if(mBuffer[0] != (dump) ZokeType::Float32)
        return def;
    return *((float*) &mBuffer[1]);
}

double dZokeReader::getFloat64(const double def) const
{
    if(mBuffer[0] != (dump) ZokeType::Float64)
        return def;
    return *((double*) &mBuffer[1]);
}

uint32_t dZokeReader::readVar(dumps& buffer)
{
    uint32_t Result = 0;
    int32_t Shift = 0;
    do
    {
        const uint32_t OneVar = (*buffer & 0x7F);
        Result |= OneVar << Shift;
        Shift += 7;
    }
    while(*(buffer++) & 0x80);
    return Result;
}

dumps dZokeReader::jumpTo(dumps buffer, uint32_t index, uint32_t jumpersize)
{
    buffer += jumpersize * (uint64_t) index;
    switch(jumpersize)
    {
    case 1: return buffer + buffer[0];
    case 2: return buffer + (buffer[0] | ((buffer[1] & 0xFF) << 8));
    case 3: return buffer + (buffer[0] | ((buffer[1] & 0xFF) << 8) | ((buffer[2] & 0xFF) << 16));
    case 4: return buffer + (buffer[0] | ((buffer[1] & 0xFF) << 8) | ((buffer[2] & 0xFF) << 16) | ((buffer[3] & 0xFF) << 24));
    default: break;
    }
    DD_assert(false, "jumpersize can only be from 1 to 4.");
    return nullptr;
}

const dZokeReader& dZokeReader::blank()
{DD_global const dZokeReader _; return _;}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dZokeReader::escaper
void dZokeReader::_init_(InitType type)
{
    mBuffer = mBinary.buffer();
}

void dZokeReader::_quit_()
{
}

void dZokeReader::_move_(_self_&& rhs)
{
    mBinary = DD_rvalue(rhs.mBinary);
    mBuffer = DD_rvalue(rhs.mBuffer);
}

void dZokeReader::_copy_(const _self_& rhs)
{
    mBinary = rhs.mBinary;
    mBuffer = rhs.mBuffer;
}

DD_passage_define_alone(dZokeReader, const dBinary& binary), mBinary(binary)
{
    mBuffer = mBinary.buffer();
}

DD_passage_define_alone(dZokeReader, const dBinary& binary, dumps buffer), mBinary(binary)
{
    mBuffer = buffer;
}

} // namespace Daddy
