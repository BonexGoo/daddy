/// @brief     Definition of escaper class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_global.hpp"

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_escaper()
//
// 사용예시-1) DD_escaper(ClassA, ParentA):
// 사용예시-2) DD_escaper(ClassA, ParentA, value1(0), value2(0)):
//                void _init_(Daddy::InitType type) {}
//                void _quit_() {}
//                void _move_(_self_&& rhs) {}
//                void _copy_(const _self_& rhs) {}
//
#define DD_escaper(CLASS, PARENT, ...) \
    /* 객체명칭통일 */ \
    private: \
        using _self_ = CLASS; \
        using _super_ = PARENT; \
    \
    \
    /* 객체-사이클 */ \
    protected: \
        CLASS(Daddy::EscapePlanP* ep) : _super_(ep), ## __VA_ARGS__ { \
        } \
    public: \
        CLASS() : _super_(__em_plan()), ## __VA_ARGS__ { \
            __init(__toVoid(this), Daddy::InitType::Create); \
        } \
        CLASS(_self_&& rhs) noexcept : _super_(__em_plan()), ## __VA_ARGS__ { \
            __move(__toVoid(this), __toVoid(&rhs)); \
            __init(__toVoid(&rhs), Daddy::InitType::ClearOnly); \
        } \
        CLASS(const _self_& rhs) : _super_(__em_plan()), ## __VA_ARGS__ { \
            __copy(__toVoid(this), __toVoid(&rhs)); \
        } \
        ~CLASS() { \
            __em_release(this, __toVoid(this)); \
        } \
        _self_& operator=(_self_&& rhs) noexcept { \
            __em_operatorMove(__toVoid(this), __toVoid(&rhs)); \
            return *this; \
        } \
        _self_& operator=(const _self_& rhs) { \
            __em_operatorCopy(__toVoid(this), __toVoid(&rhs)); \
            return *this; \
        } \
    \
    \
    /* 싱글톤관리 */ \
    protected: \
        inline static Daddy::EscapePlanP* __em_plan() { \
            DD_global_direct_ptr(Daddy::EscapePlanP*, gSingleton, Daddy::EscapeModel::__em_build( \
                _super_::__em_plan(), #CLASS, sizeof(_self_), \
                __FILE__, __LINE__, __init, __quit, __move, __copy)); \
            return gSingleton; \
        } \
    \
    \
    /* 이스케이퍼-사이클 */ \
    private: \
        static void __init(void* self, Daddy::InitType type) { \
            auto TimeNS = __toSelf(self)->__em_enter(CycleType::Init); \
            __toSelf(self)->_init_(type); /* 자신의 _init_가 없으면 부모를 호출하게 되는 원리 */ \
            __toSelf(self)->__em_leave(CycleType::Init, TimeNS); \
        } \
        static void __quit(void* self) { \
            auto TimeNS = __toSelf(self)->__em_enter(CycleType::Quit); \
            __toSelf(self)->_quit_(); /* 부모호출 원리 */ \
            __toSelf(self)->__em_leave(CycleType::Quit, TimeNS); \
        } \
        static void __move(void* self, void* rhs) { \
            auto TimeNS = __toSelf(self)->__em_enter(CycleType::Move); \
            __toSelf(self)->_move_(Daddy::DD_rvalue(*__toSelf(rhs))); /* 부모호출 원리 */ \
            __toSelf(self)->__em_leave(CycleType::Move, TimeNS); \
        } \
        static void __copy(void* self, const void* rhs) { \
            auto TimeNS = __toSelf(self)->__em_enter(CycleType::Copy); \
            __toSelf(self)->_copy_(*__toSelf(rhs)); /* 부모호출 원리 */ \
            __toSelf(self)->__em_leave(CycleType::Copy, TimeNS); \
        } \
    \
    \
    /* 형변환도구 */ \
    private: \
        inline static void* __toVoid(_self_* ptr) { \
            return (void*) (Daddy::EscapeModel*) ptr; /* 최상위 부모인 EscapeModel로 형변환함으로써 포인터주소변화가 발생가능 */ \
        } \
        inline static const void* __toVoid(const _self_* ptr) { \
            return (const void*) (const Daddy::EscapeModel*) ptr; /* 포인터주소변화 발생가능 */ \
        } \
        inline static _self_* __toSelf(void* ptr) { \
            return (_self_*) (Daddy::EscapeModel*) ptr; /* 포인터주소변화 발생가능 */ \
        } \
        inline static const _self_* __toSelf(const void* ptr) { \
            return (const _self_*) (const Daddy::EscapeModel*) ptr; /* 포인터주소변화 발생가능 */ \
        } \
    protected

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_escaper_alone()
//
// 사용예시-1) DD_escaper_alone(ClassA):
//                void _init_(Daddy::InitType type) {}
//                void _quit_() {}
//                void _move_(_self_&& rhs) {}
//                void _copy_(const _self_& rhs) {}
//
#define DD_escaper_alone(CLASS) \
    /* 객체명칭통일 */ \
    private: \
        using _self_ = CLASS; \
    \
    \
    /* 객체-사이클 */ \
    public: \
        CLASS() { \
            __model(__em_plan()); \
            __init(this, Daddy::InitType::Create); \
        } \
        CLASS(_self_&& rhs) noexcept { \
            __model(__em_plan()); \
            __move(this, &rhs); \
            __init(&rhs, Daddy::InitType::ClearOnly); \
        } \
        CLASS(const _self_& rhs) { \
            __model(__em_plan()); \
            __copy(this, &rhs); \
        } \
        ~CLASS() { \
            Daddy::EscapeModel::__em_release_alone(__model(), this); \
        } \
        _self_& operator=(_self_&& rhs) noexcept { \
            __model()->__em_operatorMove(this, &rhs); \
            return *this; \
        } \
        _self_& operator=(const _self_& rhs) { \
            __model()->__em_operatorCopy(this, &rhs); \
            return *this; \
        } \
    \
    \
    /* 싱글톤관리 */ \
    private: \
        inline static Daddy::EscapePlanP* __em_plan() { \
            DD_global_direct_ptr(Daddy::EscapePlanP*, gSingleton, Daddy::EscapeModel::__em_build( \
                (const Daddy::EscapePlanP*) 1, #CLASS, sizeof(_self_), \
                __FILE__, __LINE__, __init, __quit, __move, __copy)); \
            return gSingleton; \
        } \
        inline static Daddy::EscapeModel* __model(Daddy::EscapePlanP* ep = nullptr) { \
            static Daddy::EscapeModel gSingleton(ep); \
            return &gSingleton; \
        } \
    \
    \
    /* 이스케이퍼-사이클 */ \
    private: \
        static void __init(void* self, Daddy::InitType type) { \
            auto TimeNS = __toSelf(self)->__model()->__em_enter(Daddy::EscapeModel::CycleType::Init); \
            __toSelf(self)->_init_(type); \
            __toSelf(self)->__model()->__em_leave(Daddy::EscapeModel::CycleType::Init, TimeNS); \
        } \
        static void __quit(void* self) { \
            auto TimeNS = __toSelf(self)->__model()->__em_enter(Daddy::EscapeModel::CycleType::Quit); \
            __toSelf(self)->_quit_(); \
            __toSelf(self)->__model()->__em_leave(Daddy::EscapeModel::CycleType::Quit, TimeNS); \
        } \
        static void __move(void* self, void* rhs) { \
            auto TimeNS = __toSelf(self)->__model()->__em_enter(Daddy::EscapeModel::CycleType::Move); \
            __toSelf(self)->_move_(Daddy::DD_rvalue(*__toSelf(rhs))); \
            __toSelf(self)->__model()->__em_leave(Daddy::EscapeModel::CycleType::Move, TimeNS); \
        } \
        static void __copy(void* self, const void* rhs) { \
            auto TimeNS = __toSelf(self)->__model()->__em_enter(Daddy::EscapeModel::CycleType::Copy); \
            __toSelf(self)->_copy_(*__toSelf(rhs)); \
            __toSelf(self)->__model()->__em_leave(Daddy::EscapeModel::CycleType::Copy, TimeNS); \
        } \
    \
    \
    /* 형변환도구 */ \
    private: \
        inline static _self_* __toSelf(void* ptr) { \
            return (_self_*) ptr; \
        } \
        inline static const _self_* __toSelf(const void* ptr) { \
            return (const _self_*) ptr; \
        } \
    protected

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_escaper_alone_with_inits()
//
// 사용예시-1) DD_escaper_alone_with_inits(ClassA, value1(0), value2(0)):
//                void _init_(Daddy::InitType type) {}
//                void _quit_() {}
//                void _move_(_self_&& rhs) {}
//                void _copy_(const _self_& rhs) {}
//
#define DD_escaper_alone_with_inits(CLASS, INIT1, ...) \
    /* 객체명칭통일 */ \
    private: \
        using _self_ = CLASS; \
    \
    \
    /* 객체-사이클 */ \
    public: \
        CLASS() : INIT1, ## __VA_ARGS__ { \
            __model(__em_plan()); \
            __init(this, Daddy::InitType::Create); \
        } \
        CLASS(_self_&& rhs) noexcept : INIT1, ## __VA_ARGS__ { \
            __model(__em_plan()); \
            __move(this, &rhs); \
            __init(&rhs, Daddy::InitType::ClearOnly); \
        } \
        CLASS(const _self_& rhs) : INIT1, ## __VA_ARGS__ { \
            __model(__em_plan()); \
            __copy(this, &rhs); \
        } \
        ~CLASS() { \
            Daddy::EscapeModel::__em_release_alone(__model(), this); \
        } \
        _self_& operator=(_self_&& rhs) noexcept { \
            __model()->__em_operatorMove(this, &rhs); \
            return *this; \
        } \
        _self_& operator=(const _self_& rhs) { \
            __model()->__em_operatorCopy(this, &rhs); \
            return *this; \
        } \
    \
    \
    /* 싱글톤관리 */ \
    private: \
        inline static Daddy::EscapePlanP* __em_plan() { \
            DD_global_direct_ptr(Daddy::EscapePlanP*, gSingleton, Daddy::EscapeModel::__em_build( \
                (const Daddy::EscapePlanP*) 1, #CLASS, sizeof(_self_), \
                __FILE__, __LINE__, __init, __quit, __move, __copy)); \
            return gSingleton; \
        } \
        inline static Daddy::EscapeModel* __model(Daddy::EscapePlanP* ep = nullptr) { \
            static Daddy::EscapeModel gSingleton(ep); \
            return &gSingleton; \
        } \
    \
    \
    /* 이스케이퍼-사이클 */ \
    private: \
        static void __init(void* self, Daddy::InitType type) { \
            auto TimeNS = __toSelf(self)->__model()->__em_enter(Daddy::EscapeModel::CycleType::Init); \
            __toSelf(self)->_init_(type); \
            __toSelf(self)->__model()->__em_leave(Daddy::EscapeModel::CycleType::Init, TimeNS); \
        } \
        static void __quit(void* self) { \
            auto TimeNS = __toSelf(self)->__model()->__em_enter(Daddy::EscapeModel::CycleType::Quit); \
            __toSelf(self)->_quit_(); \
            __toSelf(self)->__model()->__em_leave(Daddy::EscapeModel::CycleType::Quit, TimeNS); \
        } \
        static void __move(void* self, void* rhs) { \
            auto TimeNS = __toSelf(self)->__model()->__em_enter(Daddy::EscapeModel::CycleType::Move); \
            __toSelf(self)->_move_(Daddy::DD_rvalue(*__toSelf(rhs))); \
            __toSelf(self)->__model()->__em_leave(Daddy::EscapeModel::CycleType::Move, TimeNS); \
        } \
        static void __copy(void* self, const void* rhs) { \
            auto TimeNS = __toSelf(self)->__model()->__em_enter(Daddy::EscapeModel::CycleType::Copy); \
            __toSelf(self)->_copy_(*__toSelf(rhs)); \
            __toSelf(self)->__model()->__em_leave(Daddy::EscapeModel::CycleType::Copy, TimeNS); \
        } \
    \
    \
    /* 형변환도구 */ \
    private: \
        inline static _self_* __toSelf(void* ptr) { \
            return (_self_*) ptr; \
        } \
        inline static const _self_* __toSelf(const void* ptr) { \
            return (const _self_*) ptr; \
        } \
    protected

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_passage()
//
// 사용예시-1) DD_passage(ClassA) {}
// 사용예시-2) DD_passage(ClassA, int a, char* b) {}
// 사용예시-3) DD_passage(ClassA, int a, char* b), c(a) {}
//
#define DD_passage(CLASS, ...)               CLASS(__VA_ARGS__, Daddy::EscapePlanP* ep = __em_plan()) : _super_(ep)

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_passage_()_with_super()
//
// 사용예시-1) DD_passage_(ClassA)_with_super(a, b) {}
// 사용예시-2) DD_passage_(ClassA, int a, char* b)_with_super(a, b) {}
// 사용예시-3) DD_passage_(ClassA, int a, char* b)_with_super(a, b), c(a) {}
//
#define DD_passage_(CLASS, ...)              CLASS(__VA_ARGS__, Daddy::EscapePlanP* ep = __em_plan()) : _super_
#define _with_super(...)                     (__VA_ARGS__, ep)

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_passage_declare()
//
// 사용예시-1) DD_passage_declare(ClassA);
// 사용예시-2) DD_passage_declare(ClassA, int a, char* b);
//
#define DD_passage_declare(CLASS, ...)       CLASS(__VA_ARGS__, Daddy::EscapePlanP* ep = __em_plan())

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_passage_define()
//
// 사용예시-1) DD_passage_define(ClassA) {}
// 사용예시-2) DD_passage_define(ClassA, int a, char* b) {}
// 사용예시-3) DD_passage_define(ClassA, int a, char* b), c(a) {}
//
#define DD_passage_define(CLASS, ...)        CLASS::CLASS(__VA_ARGS__, Daddy::EscapePlanP* ep) : _super_(ep)

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_passage_define_()_with_super()
//
// 사용예시-1) DD_passage_define_(ClassA)_with_super(a, b) {}
// 사용예시-2) DD_passage_define_(ClassA, int a, char* b)_with_super(a, b) {}
// 사용예시-3) DD_passage_define_(ClassA, int a, char* b)_with_super(a, b), c(a) {}
//
#define DD_passage_define_(CLASS, ...)       CLASS::CLASS(__VA_ARGS__, Daddy::EscapePlanP* ep) : _super_

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_passage_alone()
//
// 사용예시-1) DD_passage_alone(ClassA) {}
// 사용예시-2) DD_passage_alone(ClassA, int a, char* b) {}
// 사용예시-3) DD_passage_alone(ClassA, int a, char* b) : c(a) {}
//
#define DD_passage_alone(CLASS, ...)         CLASS(__VA_ARGS__, Daddy::EscapeModel* m = __model(__em_plan()))

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_passage_declare_alone()
//
// 사용예시-1) DD_passage_declare_alone(ClassA);
// 사용예시-2) DD_passage_declare_alone(ClassA, int a, char* b);
//
#define DD_passage_declare_alone(CLASS, ...) CLASS(__VA_ARGS__, Daddy::EscapeModel* m = __model(__em_plan()))

////////////////////////////////////////////////////////////////////////////////////////////////////
// ▶ DD_passage_define_alone()
//
// 사용예시-1) DD_passage_define_alone(ClassA) {}
// 사용예시-2) DD_passage_define_alone(ClassA, int a, char* b) {}
// 사용예시-3) DD_passage_define_alone(ClassA, int a, char* b) : c(a) {}
//
#define DD_passage_define_alone(CLASS, ...)  CLASS::CLASS(__VA_ARGS__, Daddy::EscapeModel* m)

namespace Daddy {

class Escaper;
class EscapePlanP;

enum class InitType {Create, ClearOnly};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ EscapeModel 목표
//
// 기존 class모델의 객체사이클(생성/소멸/복사생성/이동생성/복사연산/이동연산)에서 발생하는
// 불필요한 코딩관리 노력의 중복을 해소하고자 만든 매크로형 객체
//
// 6단계의 사이클이 아래와 같이 이스케이퍼 함수(_init_/_quit_/_move_/_copy_)의 조합으로 구현
// class()                     ---> this._init_(create)
// ~class()                    ---> this._quit_()
// class(class&& rhs)          ---> this._move_(rhs) + rhs._init_(clear)
// class(const class& rhs)     ---> this._copy_(rhs)
// operator=(class&& rhs)      ---> this._quit_() + this._move_(rhs) + rhs._init_(clear)
// operator=(const class& rhs) ---> this._quit_() + this._copy_(rhs)
//
// 기존 class모델은 생성자와 소멸자가 계층적으로 무조건 호출됨으로써
// 자식입장에서 멤버변수의 초기화를 다른 시나리오로 하고 싶은 경우
// 부모가 미리 모든 기능을 분화하여 준비해 주어야 하지만
// 이스케이퍼의 4가지 함수는 계층적으로 호출되는 것이 아니라
// 딱 자신만 호출하여 줌으로써 class의 계층호출구조에서 완벽히 탈출
//
// 이스케이퍼 모델은 이스케이퍼 함수의 호출량, 처리시간등 로그의 수집기능을 내장하고 있으며
// 각자 부모객체와의 연결정보를 가지고 있어 트리형태의 로그화면 구성이 가능
//
// 상속관계를 가진 class모델은 DD_escaper를 사용
// 상속이 없는 단일 class는 DD_escaper_alone을 사용
// 특수생성자가 필요한 경우에는 DD_passage계열을 사용
//
/// @brief EscapeModel
class EscapeModel
{
public:
    enum class CycleType {Init, Quit, Move, Copy};
    using InitCB = void (*)(void* self, InitType type);
    using QuitCB = void (*)(void* self);
    using MoveCB = void (*)(void* self, void* rhs);
    using CopyCB = void (*)(void* self, const void* rhs);

public:
    static EscapePlanP* __em_build(const EscapePlanP* super, Daddy::utf8s name, uint32_t size,
        Daddy::utf8s file, uint32_t line, InitCB icb, QuitCB qcb, MoveCB mcb, CopyCB ccb);
    static void __em_release(EscapeModel* model, void* self);
    static void __em_release_alone(EscapeModel* model, void* self);
public:
    int64_t __em_enter(CycleType type);
    void __em_leave(CycleType type, int64_t timeNs);
    void __em_operatorMove(void* self, void* rhs);
    void __em_operatorCopy(void* self, const void* rhs);

public:
    EscapeModel(EscapePlanP* ep);
    ~EscapeModel();
protected:
    static EscapePlanP* __em_plan() {return nullptr;}
private:
    EscapePlanP* mRefEP;
    friend class Escaper;
};

////////////////////////////////////////////////////////////////////////////////////////////////////
// ■ dEscaper 목표
//
// 본 class는 이스케이퍼를 사용함에 있어서 상속관계를 가진 class모델에서 최상위 부모이며
// 상속관계속의 자식이 불필요한 이스케이퍼 함수를 생략할 수 있도록 함이 목표
// 자식이 이스케이퍼 함수 중 _move_, _copy_를 생략하였는데 호출되면 assert-breaker가 작동
//
/// @brief dEscaper
class dEscaper : public EscapeModel
{
DD_escaper(dEscaper, EscapeModel):
    void _init_(InitType) {}
    void _quit_() {}
    void _move_(_self_&&) {DD_assert(false, "you have called an unused method.");}
    void _copy_(const _self_&) {DD_assert(false, "you have called an unused method.");}
};

} // namespace Daddy
