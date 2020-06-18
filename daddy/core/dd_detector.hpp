/// @brief     Remote based logging-SDK.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_string.hpp"
#include <functional>

namespace Daddy {

#define DD_scope(NAME)                  if(auto _ = Daddy::dDetector::scope(NAME))
#ifdef UNICODE
    #define DD_trace_info(FORMAT, ...)  Daddy::dDetector::trace(Daddy::dDetector::InfoLevel, FORMAT L" [%S:%d]", ## __VA_ARGS__, __FILE__, __LINE__)
    #define DD_trace_warn(FORMAT, ...)  Daddy::dDetector::trace(Daddy::dDetector::WarnLevel, FORMAT L" [%S:%d]", ## __VA_ARGS__, __FILE__, __LINE__)
    #define DD_trace_error(FORMAT, ...) Daddy::dDetector::trace(Daddy::dDetector::ErrorLevel, FORMAT L" [%S:%d]", ## __VA_ARGS__, __FILE__, __LINE__)
    #define DD_valid(QUERY)             do {static bool gIgnore = false; \
                                        if(!(QUERY)) Daddy::dDetector::valid(gIgnore, L"%S [%S:%d]", #QUERY, __FILE__, __LINE__);} while(false)
    #define DD_check(FORMAT, ...)       Daddy::dDetector::check(FORMAT L" [%S:%d]", ## __VA_ARGS__, __FILE__, __LINE__)
#else
    #define DD_trace_info(FORMAT, ...)  Daddy::dDetector::trace(Daddy::dDetector::InfoLevel, FORMAT " [%s:%d]", ## __VA_ARGS__, __FILE__, __LINE__)
    #define DD_trace_warn(FORMAT, ...)  Daddy::dDetector::trace(Daddy::dDetector::WarnLevel, FORMAT " [%s:%d]", ## __VA_ARGS__, __FILE__, __LINE__)
    #define DD_trace_error(FORMAT, ...) Daddy::dDetector::trace(Daddy::dDetector::ErrorLevel, FORMAT " [%s:%d]", ## __VA_ARGS__, __FILE__, __LINE__)
    #define DD_valid(QUERY)             do {static bool gIgnore = false; \
                                        if(!(QUERY)) Daddy::dDetector::valid(gIgnore, "%s [%s:%d]", #QUERY, __FILE__, __LINE__);} while(false)
    #define DD_check(FORMAT, ...)       Daddy::dDetector::check(FORMAT " [%s:%d]", ## __VA_ARGS__, __FILE__, __LINE__)
#endif

/// @brief 가상파일식 로그관리
class dDetector
{
public:
    enum Level {InfoLevel, WarnLevel, ErrorLevel};
    enum FuncID {StampST = 0, ScopeBeginST, ScopeEndST, TraceST, ValidST, CheckST, SetValueSS, SetValueST, AddValueST, KillValueS};
    enum ReadResult {Unreaded, Readed, ExitProgram, LogNotFound};
    typedef std::function<void(FuncID id, ptr payload, uint32_t size)> ReadCB;

private:
    class Stack
    {
    public:
        Stack(const dLiteral& name);
        Stack(Stack&& rhs);
        ~Stack();
        Stack& operator=(Stack&&) = delete;
        Stack& operator=(const Stack&) = delete;
    public:
        inline operator bool() const
        {return true;}
    private:
        dLiteral mName;
    };

public: // 로그키트관련
    /// @brief           프로세스 연결하기
    /// @param handle    프로세스 핸들
    static void setProcess(ptr_u handle);

public: // 로그쓰기
    /// @brief           스탬프(기점로그) 기록
    /// @param name      스탬프명
    static void stamp(dLiteral name);

    /// @brief           스코프(구간로그) 기록
    /// @param name      스코프명
    /// @return          스택처리를 위한 객체
    static Stack scope(dLiteral name);

    /// @brief           사용자 메시지 기록
    /// @param level     중요도
    /// @param format    포맷스트링
    /// @param ...       포맷인수
    static void trace(Level level, utf8s format, ...);
    static void trace(Level level, ucodes format, ...);

    /// @brief           유효성보장(Assert-Breaker)
    /// @param condition 실행조건
    /// @param format    포맷스트링
    /// @param ...       포맷인수
    static void valid(bool& condition, utf8s format, ...);
    static void valid(bool& condition, ucodes format, ...);

    /// @brief           사용자 분기입력 대기
    /// @param format    포맷스트링
    /// @param ...       포맷인수
    /// @return          스택처리를 위한 객체
    static bool check(utf8s format, ...);
    static bool check(ucodes format, ...);

    /// @brief           사용자 프로퍼티 입력(스트링타입)
    /// @param name      프로퍼티명
    /// @param format    변경할 값(포맷스트링)
    /// @param ...       포맷인수
    static void setValue(dLiteral name, utf8s format, ...);
    static void setValue(dLiteral name, ucodes format, ...);

    /// @brief           사용자 프로퍼티 입력(정수타입)
    /// @param name      프로퍼티명
    /// @param value     변경할 값
    static void setValue(dLiteral name, int32_t value);

    /// @brief           사용자 프로퍼티 증감입력(정수타입)
    /// @param name      프로퍼티명
    /// @param addition  증감할 값
    static void addValue(dLiteral name, int32_t addition);

    /// @brief           사용자 프로퍼티 제거
    /// @param name      프로퍼티명
    static void killValue(dLiteral name);

public: // 로그읽기
    /// @brief           로그 가져오기
    /// @param cb        가져온 새 로그를 받을 콜백함수
    /// @return          Unreaded-새 로그가 없음, Readed-로그 읽었음
    /// @return          ExitProgram-로그쓰기 응용프로그램이 종료
    /// @return          LogNotFound-애초에 로그파일 로딩실패
    /// @return          LogBloken-비정상적 로그파일
    static ReadResult readOnce(ReadCB cb);

    /// @brief           페이로드에서 32비트정수 반환
    /// @param payload   페이로드를 해석후 다음으로 이동
    /// @return          해석된 32비트정수
    static int32_t parseInt32(ptr& payload);

    /// @brief           페이로드에서 64비트정수 반환
    /// @param payload   페이로드를 해석후 다음으로 이동
    /// @return          해석된 64비트정수
    static int64_t parseInt64(ptr& payload);

    /// @brief           페이로드에서 스트링 반환
    /// @param payload   페이로드를 해석후 다음으로 이동
    /// @return          해석된 스트링
    static utf8s parseString(ptr& payload);
};

} // namespace Daddy
