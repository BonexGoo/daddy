/// @brief     Definition of patcher class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_binary.hpp"
#include "dd_handle.hpp"
#include <functional>

namespace Daddy {

/// @brief 가상IO식 파일패치
class dPatcher
{
public:
    DD_handle(IOData);
    DD_handle(LocalData);
    DD_handle(Schedule);
    typedef uint32_t vercode;
    enum worktype:uint8_t {NoWork = 0, Download, Upload};
    enum datatype:utf8 {UploadMemo = 'a', Changed = 'c', Erased = 'e', TotalHash = 'z'};
    enum steptype:uint8_t {CheckingForDownload = 0, CleaningForDownload, Downloading, CopyingForUpload, Uploading};
    typedef std::function<dBinary(vercode version, datatype type, dLiteral dataname)> IOReadCB;
    typedef std::function<bool(vercode version, datatype type, dLiteral dataname, const dBinary& data)> IOWriteCB;
    typedef std::function<void(steptype type, float progress, dLiteral detail)> LogCB;

public: // IO연결
    /// @brief              IORead연결
    /// @param reader       콜백함수
    void setReader(IOReadCB reader);

    /// @brief              IOWrite연결
    /// @param writer       콜백함수
    void setWriter(IOWriteCB writer);

    /// @brief              Status연결
    /// @param logger       콜백함수
    void setLogger(LogCB logger);

public: // 사용성
    /// @brief              마지막 버전코드 검색
    /// @param startversion 검색 시작버전(특별히 없으면 0)
    /// @return             마지막 버전코드
    /// @see                readyForDownload
    vercode searchLatestVersion(vercode startversion = 0) const;

    /// @brief              다운로드용 지정 IO데이터 준비
    /// @param version      타겟버전
    /// @return             다운로드용 IO데이터
    /// @see                build
    IOData readyForDownload(vercode version) const;

    /// @brief              업로드용 최신 IO데이터 준비
    /// @param startversion 검색 시작버전(특별히 없으면 0)
    /// @return             업로드용 IO데이터
    /// @see                build
    IOData readyForUpload(vercode startversion = 0) const;

    /// @brief              로컬데이터 준비
    /// @param dirpath      탐색할 폴더경로
    /// @return             로컬데이터
    /// @see                build
    static LocalData readyForLocal(dLiteral dirpath);

    /// @brief              스케줄 생성
    /// @param io           IO데이터(다운로드 or 업로드)
    /// @param local        로컬데이터(기존 파일에 병합 or 수정된 파일을 분석)
    /// @return             작업정보가 기록된 스케줄(기존 버전 or 새 버전)
    /// @see                drive
    static Schedule build(IOData io, LocalData local);

    /// @brief              스케줄 구동
    /// @param schedule     구동할 스케줄
    /// @param memo         간략한 정보삽입
    /// @return             true-성공, false-실패
    /// @see                build, load, save
    bool drive(Schedule schedule, dLiteral memo) const;

public: // 도구
    /// @brief              스케줄 불러오기
    /// @param filepath     파일경로
    /// @return             스케줄
    /// @see                save, drive
    static Schedule load(dLiteral filepath);

    /// @brief              스케줄 저장하기
    /// @param schedule     저장할 스케줄
    /// @param filepath     파일경로
    /// @return             true-성공, false-실패
    /// @see                load
    static bool save(const Schedule& schedule, dLiteral filepath);

    /// @brief              스케줄의 작업종류
    /// @param schedule     확인할 스케줄
    /// @return             작업종류
    /// @see                load, drive
    static worktype getType(const Schedule& schedule);

    /// @brief              스케줄의 타겟버전
    /// @param schedule     확인할 스케줄
    /// @return             타겟버전
    static vercode getVersion(const Schedule& schedule);

    /// @brief              스케줄의 메모내용
    /// @param schedule     확인할 스케줄
    /// @return             메모내용
    static dString getMemo(const Schedule& schedule);

DD_escaper_alone(dPatcher): // 객체사이클
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    IOReadCB mReader;
    IOWriteCB mWriter;
    LogCB mLogger;

public:
    DD_passage_declare_alone(dPatcher, IOReadCB reader, IOWriteCB writer, LogCB logger);
};

} // namespace Daddy
