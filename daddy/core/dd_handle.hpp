/// @brief     Definition of handle class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include "dd_escaper.hpp"

namespace Daddy {

#define DD_handle(TYPE) \
    class TYPE : public dHandle { \
    DD_escaper(TYPE, dHandle): \
    public: \
    DD_passage_(TYPE, ptr_u handle, Destroyer destroyer)_with_super(handle, destroyer) {}}

class HandleAgentP;

/// @brief 핸들객체
class dHandle : public dEscaper
{
public: // 사용성
    /// @brief          핸들의 유효성
    /// @return         true-유효함, false-무효함
    bool isValid() const;

    /// @brief          핸들을 무효화
    /// @param forced   데이터객체를 우선 삭제할지의 여부
    void clear(bool forced);

    /// @brief          데이터객체 반환
    /// @return         데이터객체
    template<typename TYPE>
    TYPE* get() const {return (TYPE*) TYPE::toClass(getHandle());}

public:
    typedef void (*Destroyer)(ptr_u handle);
    static Destroyer defaultDestroyer();

private:
    ptr_u getHandle() const;
    static const dHandle& blank();

DD_escaper(dHandle, dEscaper): // 객체사이클
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    HandleAgentP* mRefAgent;

protected:
    DD_passage_declare(dHandle, ptr_u handle, Destroyer destroyer);
};

} // namespace Daddy
