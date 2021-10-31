/// @brief     Definition of patcher class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_binary.hpp"
#include "dd_handle.hpp"
#include "dd_string.hpp"
#include <functional>
#include <string>

namespace Daddy {

/// @brief 가상IO식 파일패치
class dPatcher
{
public:
    DD_handle(IOData);
    DD_handle(LocalData);
    DD_handle(Schedule);
    typedef int32_t vercode;
    enum worktype:uint8_t {WT_NoWork = 0, WT_Download, WT_Upload};
    enum datatype:utf8 {DT_UploadMemo = 'a', DT_Changed = 'c', DT_Erased = 'e', DT_TotalHash = 'z'};
    enum steptype:uint8_t {ST_CheckingForDownload = 0, ST_CleaningForDownload, ST_Downloading, ST_CopyingForUpload, ST_Uploading};
    enum comparetype:uint8_t {CT_Same = 0, CT_Added, CT_Removed, CT_Different};
    enum uploadstep:uint8_t {US_Ready = 0, US_Remove, US_Create, US_Done, US_Error_UploadFail = -1, US_Error_UnknownStep = -2};
    typedef std::function<dString(uint32_t index)> IOGetGroupNameCB;
    typedef std::function<void(dString groupname)> IOSetGroupFocusCB;
    typedef std::function<dBinary(vercode version, datatype type, dLiteral dataname)> IOReadCB;
    typedef std::function<bool(vercode version, datatype type, dLiteral dataname, const dBinary& data)> IOWriteCB;

public: // IO연결
    /// @brief              IOGetGroupNameCB연결
    /// @param groupgetter  콜백함수
    void setGroupGetter(IOGetGroupNameCB getter);

    /// @brief              IOSetGroupFocusCB연결
    /// @param groupsetter  콜백함수
    void setGroupSetter(IOSetGroupFocusCB setter);

    /// @brief              IORead연결
    /// @param reader       콜백함수
    void setReader(IOReadCB reader);

    /// @brief              IOWrite연결
    /// @param writer       콜백함수
    void setWriter(IOWriteCB writer);

public: // 사용성
    /// @brief              전체 그룹의 수량 반환
    /// @return             그룹의 수량
    /// @see                getGroupName, setGroupFocusing
    uint32_t getGroupCount();

    /// @brief              그룹명 반환
    /// @param index        해당 그룹의 인덱스
    /// @return             그룹명
    /// @see                getGroupCount, setGroupFocusing
    dString getGroupName(uint32_t index);

    /// @brief              그룹을 포커싱
    /// @param groupname    그룹명(신규 그룹명 가능)
    /// @see                getGroupCount, getGroupName
    void setGroupFocusing(dLiteral groupname);

    /// @brief              포커싱된 그룹의 마지막 버전코드 검색
    /// @param startversion 검색 시작버전(특별히 없으면 0)
    /// @return             마지막 버전코드
    /// @see                readyForDownload
    vercode searchLatestVersion(vercode startversion = 0) const;

    /// @brief              포커싱된 그룹의 다운로드용 지정 IO데이터 준비
    /// @param version      타겟버전
    /// @return             다운로드용 IO데이터
    /// @see                compare
    IOData readyForDownload(vercode version) const;

    /// @brief              포커싱된 그룹의 업로드용 최신 IO데이터 준비
    /// @param startversion 검색 시작버전(특별히 없으면 0)
    /// @param getversion   검색된 버전(nullptr가능)
    /// @return             업로드용 IO데이터
    /// @see                compare
    IOData readyForUpload(vercode startversion = 0, vercode* getversion = nullptr) const;

    /// @brief              로컬데이터 준비
    /// @param dirpath      탐색할 폴더경로(슬래시포함 → C:/aaa/bbb/)
    /// @return             로컬데이터
    /// @see                compare
    static LocalData readyForLocal(dLiteral dirpath);

    /// @brief              비교정보 생성
    /// @param io           IO데이터(다운로드 or 업로드)
    /// @param local        로컬데이터(기존 파일에 병합 or 수정된 파일을 분석)
    /// @return             true-스케줄필요, false-스케줄불필요
    /// @see                build
    static bool compare(IOData io, LocalData local);

    /// @brief              스케줄 생성
    /// @param io           IO데이터(다운로드 or 업로드)
    /// @param local        로컬데이터(기존 파일에 병합 or 수정된 파일을 분석)
    /// @param memo         간략한 정보삽입
    /// @return             작업정보가 기록된 스케줄(기존 버전 or 새 버전)
    /// @see                compare, driveOnce
    static Schedule build(IOData io, LocalData local, dLiteral memo);

    /// @brief              스케줄 구동
    /// @param schedule     구동할 스케줄
    /// @param msec         구동할 시간
    /// @return             true-구동계속, false-스케줄완료
    /// @see                build, load, save
    bool driveOnce(Schedule schedule, uint32_t msec);

public: // 상태도구
    /// @brief              스케줄 불러오기
    /// @param filepath     파일경로
    /// @return             스케줄
    /// @see                save, driveOnce
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
    /// @see                load, driveOnce
    static worktype getType(const Schedule& schedule);

    /// @brief              스케줄의 타겟버전
    /// @param schedule     확인할 스케줄
    /// @return             타겟버전
    static vercode getVersion(const Schedule& schedule);

    /// @brief              스케줄의 메모내용(build시 입력)
    /// @param schedule     확인할 스케줄
    /// @return             메모내용
    static dString getMemo(const Schedule& schedule);

    /// @brief              스케줄의 진행경과
    /// @param schedule     확인할 스케줄
    /// @param detail       부연설명
    /// @return             Permil값
    static uint32_t getProgress(const Schedule& schedule, dString* detail = nullptr);

public: // 비주얼도구
    struct RenderStatus
    {
        uint32_t mDeep {0};
        uint32_t mPos {0};
        bool mExpanded {false};
        comparetype mCompare {CT_Same};
    };
    typedef std::function<uint32_t(uint32_t ui, const RenderStatus& status, const std::string& lpath)> RenderCB;

    /// @brief              IO데이터를 즉시 랜더링
    /// @param data         IO데이터
    /// @param renderer     랜더링용 콜백함수
    /// @return             랜더링된 세로길이
    static uint32_t renderOnce(IOData data, RenderCB renderer);

    /// @brief              로컬데이터를 즉시 랜더링
    /// @param data         로컬데이터
    /// @param renderer     랜더링용 콜백함수
    /// @return             랜더링된 세로길이
    static uint32_t renderOnce(LocalData data, RenderCB renderer);

    /// @brief              UI요소의 확장기능 반전
    /// @param ui           해당되는 UI요소의 ID
    /// @return             true-성공, false-실패
    static bool toggleExpand(uint32_t ui);

DD_escaper_alone(dPatcher): // 객체사이클
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    IOGetGroupNameCB mGroupGetter;
    IOSetGroupFocusCB mGroupSetter;
    IOReadCB mReader;
    IOWriteCB mWriter;

public:
    DD_passage_declare_alone(dPatcher, IOGetGroupNameCB getter, IOSetGroupFocusCB setter, IOReadCB reader, IOWriteCB writer);
};

} // namespace Daddy
