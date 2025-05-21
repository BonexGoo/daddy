/// @brief     Definition of vtk-canvas class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include <functional>
#include <daddy.hpp>

namespace Daddy {

class VtkCanvasAgentP;

/// @brief VTK캔버스객체
class dVtkCanvas
{
public:
    typedef std::function<void(utf8s wid, dVtkCanvas& canvas)> PassCB;

public: // 위젯사용성
    /// @brief          부모의 ptr값 등록
    /// @param parent   포인트주소
    void setParent(ptr parent);

    /// @brief          위치와 크기를 셋팅
    /// @param x        위치 X
    /// @param y        위치 Y
    /// @param width    가로크기
    /// @param height   세로크기
    void setGeometry(int32_t x, int32_t y, int32_t width, int32_t height);

    /// @brief          보여짐 상태를 셋팅
    /// @param show     보여질지의 여부
    void setVisible(bool show);

    /// @brief          델리게이트 함수등록
    void addDelegate();

    /// @brief          스타일 반환
    /// @return         스타일
    dString style() const;

    /// @brief          채널 반환
    /// @return         채널
    dString channel() const;

    /// @brief          컬러 반환
    /// @return         컬러
    dString color() const;

public: // VTK사용성
    void setDicom(ptr dicom);

public: // UI설정
    /// @brief          레이아웃의 마진값 셋팅
    /// @param left     마진값 Left
    /// @param top      마진값 Top
    /// @param right    마진값 Right
    /// @param bottom   마진값 Bottom
    static void setLayoutMargin(int32_t left, int32_t top, int32_t right, int32_t bottom);

    /// @brief          레이아웃의 마진값 반환
    /// @return         마진값 Left
    static int32_t layoutMarginL();

    /// @brief          레이아웃의 마진값 반환
    /// @return         마진값 Top
    static int32_t layoutMarginT();

    /// @brief          레이아웃의 마진값 반환
    /// @return         마진값 Right
    static int32_t layoutMarginR();

    /// @brief          레이아웃의 마진값 반환
    /// @return         마진값 Bottom
    static int32_t layoutMarginB();

    /// @brief          캔버스사이 간격값 셋팅
    /// @param x        간격값 X
    /// @param y        간격값 Y
    static void setCanvasSpacing(int32_t x, int32_t y);

    /// @brief          캔버스사이 간격값 반환
    /// @return         간격값 X
    static int32_t canvasSpacingX();

    /// @brief          캔버스사이 간격값 반환
    /// @return         간격값 Y
    static int32_t canvasSpacingY();

public: // 회람
    /// @brief          모든 캔버스를 회람
    /// @param cb       콜백함수
    static void passAll(PassCB cb);

private:
    static const dVtkCanvas& blank();

DD_escaper_alone(dVtkCanvas): // 객체사이클
    void _init_(InitType type);
    void _quit_();
    void _move_(_self_&& rhs);
    void _copy_(const _self_& rhs);
    VtkCanvasAgentP* mRefAgent;

public:
    DD_passage_declare_alone(dVtkCanvas, dLiteral wid, dLiteral style, dLiteral channel, dLiteral color);
};

} // namespace Daddy
