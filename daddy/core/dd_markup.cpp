﻿/// @brief     Definition of markup class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_markup.hpp"

// Dependencies
#include <stack>

namespace Daddy {

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dMarkup
void dMarkup::loadYaml(const dString& yaml)
{
    typedef std::pair<int32_t, dMarkup*> Level;
    clear();

    // 파싱도구 : 공백을 건너뛰고 공백수를 리턴
    auto SkipSpace = [](utf8s_nn& focus, utf8s_nn end)->int32_t
    {
        utf8s_nn OldFocus = focus;
        while(*focus == ' ' && ++focus < end);
        return int32_t(focus - OldFocus);
    };

    // 파싱도구 : token의 직후로 위치이동
    auto SkipToken = [](utf8 token, utf8s_nn& focus, utf8s_nn end)->void
    {
        while(*(focus++) != token && focus < end);
    };

    // 파싱도구 : 멀티라인을 건너뛰고 수집된 스트링을 리턴
    auto SkipMultiLine = [SkipSpace, SkipToken](utf8 option, utf8s_nn& focus, utf8s_nn end)->dString
    {
        dString Collector;
        const int32_t FirstSpace = SkipSpace(focus, end);
        do
        {
            utf8s_nn LineBegin = focus;
            SkipToken('\n', focus, end);
            utf8s_nn LineEnd = focus;
            Collector.add(LineBegin, uint32_t(LineEnd - LineBegin));

            // 멀티라인 연장여부
            const int32_t NextSpace = SkipSpace(focus, end);
            if(FirstSpace < NextSpace) // 추가공백
                focus = LineEnd + FirstSpace;
            else if(NextSpace < FirstSpace && *focus != '\r' && *focus != '\n') // 연장실패
            {
                focus = LineEnd;
                if(option == '+') DD_nothing;
                else
                {
                    auto Yaml = (dLiteral) Collector;
                    utf8s_nn Focus = Yaml.string();
                    int32_t Length = Yaml.length();
                    while(Focus[Length - 1] == '\n')
                        if(Focus[--Length - 1] == '\r')
                            Length--;
                    if(option == '-')
                        return Collector.clone(0, Length);
                    else
                    {
                        if(Focus[Length] == '\r') Length++;
                        if(Focus[Length] == '\n') Length++;
                        return Collector.clone(0, Length);
                    }
                }
                break;
            }
        }
        while(true);
        return Collector;
    };

    // Yaml영역지정
    auto Yaml = (dLiteral) yaml;
    utf8s_nn Focus = Yaml.string();
    utf8s_nn End = Focus + Yaml.length();
    for(uint32_t i = 2; Focus + i < End; ++i) // 시작지점('---') 찾기
    {
        if(Focus[i] == '-' && Focus[i - 1] == '-' && Focus[i - 2] == '-')
        {
            Focus = &Focus[i + 1];
            SkipToken('\n', Focus, End);
            for(i = 2; Focus + i < End; ++i) // 끝지점('...') 찾기
            {
                if(Focus[i] == '.' && Focus[i - 1] == '.' && Focus[i - 2] == '.')
                {
                    End = &Focus[i - 2];
                    break;
                }
            }
            break;
        }
    }

    // Yaml파싱
    std::map<std::string, dMarkup*> RefMap;
    std::stack<Level> LevelStack;
    LevelStack.push(Level(-1, this));
    dMarkup* LastLevel = nullptr;
    utf8s_nn LastName = Focus;
    int32_t LastHalfSpace = 0;
    while(Focus <= End)
    {
        // 라인시작
        if(!LastLevel)
        {
            // 공백조사
            LastHalfSpace = SkipSpace(Focus, End) * 2;

            // 인덱스
            if(*Focus == '-' && (Focus[1] == ' ' || Focus[1] == '\r' || Focus[1] == '\n'))
            {
                LastHalfSpace++; // 반칸전진
                while(LastHalfSpace <= LevelStack.top().first)
                    LevelStack.pop(); // 공백까지 스택팝
                LastLevel = &(LevelStack.top().second->atAdding());
                LevelStack.push(Level(LastHalfSpace, LastLevel));
                LastHalfSpace++; // 반칸전진

                // 공백추가
                LastHalfSpace += SkipSpace(++Focus, End) * 2;
            }
            // 유효키
            else if(*Focus != '\r' && *Focus != '\n' && *Focus != '#')
            {
                while(LastHalfSpace <= LevelStack.top().first)
                    LevelStack.pop(); // 공백까지 스택팝
                LastLevel = LevelStack.top().second;
            }
            // 무효라인
            else SkipToken('\n', Focus, End);
            LastName = Focus;
        }

        // 값완료
        else if(Focus == End || *Focus == '\n' || *Focus == '#')
        {
            if(const int32_t Length = int32_t(Focus - LastName))
            {
                const auto& NewValue = yaml.clone(int32_t(LastName - Yaml.string()), Length).trimSpace();
                if(NewValue[0] == '|') // 멀티라인
                {
                    SkipToken('\n', Focus, End);
                    const utf8 Option = (1 < NewValue.length())? NewValue[1] : ' ';
                    LastLevel->set(SkipMultiLine(Option, Focus, End));
                    Focus--; // 개행문자 이전으로 이동
                }
                else if(NewValue[0] == '&') // 참조
                {
                    const auto NewLiteral = (dLiteral) NewValue;
                    RefMap[std::string(NewLiteral.string() + 1, NewLiteral.length() - 1)] = LastLevel;
                }
                else if(NewValue[0] == '*') // 복사
                {
                    const auto NewLiteral = (dLiteral) NewValue;
                    auto it = RefMap.find(std::string(NewLiteral.string() + 1, NewLiteral.length() - 1));
                    if(it != RefMap.end())
                        *LastLevel = *it->second;
                }
                else LastLevel->set(NewValue.trimQuote());
            }
            LastLevel = nullptr;
            SkipToken('\n', Focus, End);
        }

        // 키완료
        else if(*Focus == ':' && (Focus[1] == ' ' || Focus[1] == '\r' || Focus[1] == '\n'))
        {
            if(const int32_t Length = int32_t(Focus - LastName))
            {
                const auto& NewKey = yaml.clone(int32_t(LastName - Yaml.string()), Length).trimSpace();
                if(NewKey.length() == 2 && NewKey[0] == '<' && NewKey[1] == '<')
                    DD_nothing; // 키생략
                else
                {
                    LastLevel = &LastLevel->at(NewKey.trimQuote());
                    LastLevel->clear(); // 중복키처리
                    LevelStack.push(Level(LastHalfSpace, LastLevel));
                }
            }
            LastName = ++Focus;
        }

        // 문자열
        else if(*Focus == '\"' || *Focus == '\'')
        {
            const utf8 EndCode = *(Focus++);
            SkipToken(EndCode, Focus, End);
        }

        // 일반문자
        else Focus++;
    }
}

dString dMarkup::saveYaml() const
{
    dBinary Collector;
    Collector.add((dumps) "---\n", 4);
    saveYamlCore(Collector, 0, false);
    Collector.add((dumps) "...\n", 4);
    return dString::fromBinaryUTF8(Collector);
}

void dMarkup::clear()
{
    _quit_();
    _init_(InitType::Create);
}

bool dMarkup::isValid() const
{
    return (this != &blank());
}

const dString& dMarkup::get() const
{
    return mValue;
}

const dString dMarkup::get(const dLiteral& def) const
{
    if(isValid())
        return get();
    return dString(def);
}

void dMarkup::set(const dString& value)
{
    mValue = value;
}

uint32_t dMarkup::length() const
{
    if(mNameable)
        return (uint32_t) mNameable->size();
    if(mIndexable)
        return (uint32_t) mIndexable->size();
    return 0;
}

dMarkup& dMarkup::at(const dLiteral& key)
{
    if(!mNameable) mNameable = new NameableMap();
    return (*mNameable)[std::string(key.string(), key.length())];
}

dMarkup& dMarkup::at(uint32_t index)
{
    if(!mIndexable) mIndexable = new IndexableMap();
    if(mIndexable->size() <= index)
        mIndexable->resize(index + 1);
    return (*mIndexable)[index];
}

dMarkup& dMarkup::atAdding()
{
    if(!mIndexable) mIndexable = new IndexableMap();
    const uint32_t OldSize = mIndexable->size();
    mIndexable->resize(OldSize + 1);
    return (*mIndexable)[OldSize];
}

const dMarkup& dMarkup::operator()(const dLiteral& key) const
{
    if(mNameable)
    {
        auto it = mNameable->find(std::string(key.string(), key.length()));
        if(it != mNameable->end())
            return it->second;
    }
    return blank();
}

const dMarkup& dMarkup::operator[](uint32_t index) const
{
    if(mIndexable)
    {
        if(index < mIndexable->size())
            return (*mIndexable)[index];
    }
    return blank();
}

dMarkup& dMarkup::operator+=(const dMarkup& rhs)
{
    mValue = rhs.mValue;
    if(rhs.mNameable)
    {
        if(!mNameable)
            mNameable = new NameableMap();
        for(auto& it : *rhs.mNameable)
            (*mNameable)[it.first] += it.second;
    }
    if(rhs.mIndexable)
    {
        if(!mIndexable)
            mIndexable = new IndexableMap();

        const uint32_t Size = rhs.mIndexable->size();
        mIndexable->resize(Size);
        for(uint32_t i = 0; i < Size; ++i)
            (*mIndexable)[i] = (*rhs.mIndexable)[i];
    }
    return *this;
}

void dMarkup::debugPrint(uint32_t space) const
{
    if(0 < mValue.length())
    {
        auto OneLiteral = (dLiteral) mValue;
        printf("%*s\"%.*s\"\n", space, "", OneLiteral.length(), OneLiteral.string());
    }

    if(mNameable)
    for(auto& it : *mNameable)
    {
        printf("%*s%s:\n", space, "", it.first.c_str());
        it.second.debugPrint(space + mSpaceSize);
    }

    if(mIndexable)
    for(uint32_t i = 0, iend = mIndexable->size(); i < iend; ++i)
    {
        printf("%*s[%d]:\n", space, "", i);
        (*mIndexable)[i].debugPrint(space + mSpaceSize);
    }
}

const dMarkup& dMarkup::blank()
{DD_global_direct(dMarkup, _); return _;}

void dMarkup::saveYamlCore(dBinary& collector, uint32_t space, uint32_t indent) const
{
    if(0 < mValue.length())
    {
        auto OneLiteral = (dLiteral) mValue;
        auto LiteralPtr = OneLiteral.string();
        auto LiteralLen = OneLiteral.length();
        uint32_t iBefore = 0;
        uint32_t Space = (indent)? indent : space;
        indent = 0;

        // 멀티라인
        for(uint32_t i = 0; i < LiteralLen; ++i)
        {
            if(LiteralPtr[i] == '\n')
            {
                if(!iBefore)
                {
                    auto NewString = dString::print("%*s|\n", Space, "");
                    collector.add((dumps) NewString.string(), NewString.length());
                    // 공백계산
                    auto CalcPtr = (utf8s_nn) collector.buffer();
                    for(uint32_t j = collector.length() - 1; 0 <= j; --j)
                        if(j == 0 || CalcPtr[j - 1] == '\n')
                        {
                            Space = collector.length() - j - 2;
                            break;
                        }
                }
                auto NewString = dString::print("%*s%.*s\n", Space, "", i - iBefore, &LiteralPtr[iBefore]);
                collector.add((dumps) NewString.string(), NewString.length());
                iBefore = i + 1;
            }
        }

        // 싱글라인
        auto NewString = dString::print("%*s%.*s\n", Space, "", LiteralLen - iBefore, &LiteralPtr[iBefore]);
        collector.add((dumps) NewString.string(), NewString.length());
    }

    if(mNameable)
    for(auto& it : *mNameable)
    {
        if(0 < it.second.mValue.length())
        {
            auto NewString = dString::print("%*s%s:", (indent)? indent : space, "", it.first.c_str());
            collector.add((dumps) NewString.string(), NewString.length());
            it.second.saveYamlCore(collector, 0, 1);
            indent = 0;
        }
        else
        {
            auto NewString = dString::print("%*s%s:\n", (indent)? indent : space, "", it.first.c_str());
            collector.add((dumps) NewString.string(), NewString.length());
            it.second.saveYamlCore(collector, space + mSpaceSize, false);
            indent = 0;
        }
    }

    if(mIndexable)
    for(uint32_t i = 0, iend = mIndexable->size(); i < iend; ++i)
    {
        auto NewString = dString::print("%*s-", (indent)? indent : space, "");
        collector.add((dumps) NewString.string(), NewString.length());
        (*mIndexable)[i].saveYamlCore(collector, space + mSpaceSize, mSpaceSize - 1);
        indent = 0;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dMarkup::escaper
void dMarkup::_init_(InitType type)
{
    mNameable = nullptr;
    mIndexable = nullptr;
}

void dMarkup::_quit_()
{
    delete mNameable;
    delete mIndexable;
}

void dMarkup::_move_(_self_&& rhs)
{
    mValue = DD_rvalue(rhs.mValue);
    mNameable = rhs.mNameable;
    mIndexable = rhs.mIndexable;
}

void dMarkup::_copy_(const _self_& rhs)
{
    mValue = rhs.mValue;
    mNameable = (rhs.mNameable)? new NameableMap(*rhs.mNameable) : nullptr;
    mIndexable = (rhs.mIndexable)? new IndexableMap(*rhs.mIndexable) : nullptr;
}

DD_passage_define_alone(dMarkup, const dString& yaml)
{
    mNameable = nullptr;
    mIndexable = nullptr;
    loadYaml(yaml);
}

} // namespace Daddy
