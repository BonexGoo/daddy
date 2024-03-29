﻿/// @brief     Definition of platform functions.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_binary.hpp"
#include "dd_string.hpp"
#include <functional>
#include <string>
#include <map>

namespace Daddy {

class SocketAgentP;

/// @brief 소켓객체
class dSocket
{
public:
    enum class AssignType {Entrance, Leaved};
    typedef std::function<void(AssignType type, uint32_t id)> AssignCB;
    typedef std::function<void(uint32_t id, const dBinary& binary)> RecvCB;

public: // 사용성
    /// @brief            클라이언트로 객체생성(connect)
    /// @param host       호스트주소
    /// @param port       포트번호
    /// @param cb         연결상황수신용 콜백함수
    /// @return           true-성공, false-실패
    bool openClient(dLiteral host, uint16_t port, AssignCB cb = nullptr);

    /// @brief            서버로 객체생성(bind + listen)
    /// @param port       포트번호
    /// @param cb         연결상황수신용 콜백함수
    /// @return           true-성공, false-실패
    bool openServer(uint16_t port, AssignCB cb = nullptr);

    /// @brief            객체소멸
    void close();

    /// @brief            연결된 상대방의 수량
    /// @return           상대방의 수량
    uint32_t count() const;

    /// @brief            특정 상대방에게 바이너리 발송
    /// @param id         상대방의 번호(상대가 서버면 0, 상대가 클라이언트면 0~N)
    /// @param binary     발송할 바이너리
    /// @param sizefield  true-사이즈필드(uint32_t) 사용, false-사이즈필드 미사용
    /// @return           true-성공, false-실패
    bool sendTo(uint32_t id, const dBinary& binary, bool sizefield);

    /// @brief            모든 상대방에게 바이너리 발송
    /// @param binary     발송할 바이너리
    /// @param sizefield  true-사이즈필드(uint32_t) 사용, false-사이즈필드 미사용
    /// @return           true-모두 성공, false-모두 성공이 아님
    bool sendAll(const dBinary& binary, bool sizefield);

    /// @brief            특정 상대방에게서 바이너리 수취
    /// @param id         상대방의 번호(상대가 서버면 0, 상대가 클라이언트면 0~N)
    /// @return           수취된 바이너리
    dBinary recvFrom(uint32_t id);

    /// @brief            모든 상대방에게서 바이너리 수취
    /// @param cb         데이터수신용 콜백함수(1회성)
    void recvAll(RecvCB cb);

    /// @brief            특정 상대방과의 연결해제
    /// @param id         상대방의 번호(상대가 서버면 0, 상대가 클라이언트면 0~N)
    void kick(uint32_t id);

private:
    static const dSocket& blank();

DD_escaper_alone(dSocket): // 객체사이클
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    SocketAgentP* mRefAgent;

private:
    DD_passage_declare_alone(dSocket, ptr_u agent); // move only
};

/// @brief 디렉토리객체
class dDirectory
{
public:
    struct FileStatus
    {
        bool mReadOnly;
        uint64_t mFileSize;
        uint64_t mCreationTime;
        uint64_t mLastAccessTime;
        uint64_t mLastWriteTime;
    };
    static uint64_t now();
    static dString toUTCTime(uint64_t filetime);

public:
    /// @brief            디렉토리 탐색
    /// @param dirpath    탐색할 폴더경로(슬래시포함 → C:/aaa/bbb/)
    void load(dLiteral dirpath);

public:
    inline std::map<std::string, bool>& dirs() {return mDirs;}
    inline const std::map<std::string, bool>& dirs() const {return mDirs;}
    inline std::map<std::string, FileStatus>& files() {return mFiles;}
    inline const std::map<std::string, FileStatus>& files() const {return mFiles;}

DD_escaper_alone(dDirectory): // 객체사이클
    void _init_(InitType);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    std::map<std::string, bool> mDirs;
    std::map<std::string, FileStatus> mFiles;

public:
    DD_passage_declare_alone(dDirectory, dLiteral dirpath);
};

/// @brief 프로세스
class dProcess
{
public:
    /// @brief            프로세스 실행
    /// @param exepath    응용프로그램의 절대경로
    /// @param args       응용프로그램에 전달되는 인수들
    /// @param runtype    실행방식("certify_only", "run", "run_with_console")
    /// @param runpath    실행경로
    /// @return           프로세스핸들
    static ptr_u runProcess(dLiteral exepath, dLiteral args = "", dLiteral runtype = "run", dLiteral runpath = "");

    /// @brief            해당 프로세스 강제종료
    /// @param handle     프로세스핸들
    static void killProcess(ptr_u handle);

    /// @brief            전체 프로세스 강제종료
    /// @param name       프로세스명칭
    static void killProcessAll(dLiteral exename);
};

} // namespace Daddy
