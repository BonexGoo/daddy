/// @brief     Definition of vtk-canvas child class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_widget.hpp"

// Dependencies
#include <cstdlib>
#include <vtkNamedColors.h>
#include <vtkRenderer.h>

namespace Daddy {

VtkWidgetP::VtkWidgetP(const dLiteral& domheader) : mDomHeader(domheader)
{
    mVisibled = -1;
    mRenderer = vtkSmartPointer<vtkRenderer>::New();
    mRenderer->ResetCamera();

    auto BGColor = vtkSmartPointer<vtkNamedColors>::New();
    const unsigned char Red = std::rand() % 255;
    const unsigned char Green = std::rand() % 255;
    const unsigned char Blue = std::rand() % 255;
    std::array<unsigned char, 4> bkg = {Red, Green, Blue, 255};
    BGColor->SetColor("BkgColor", bkg.data());
    mRenderer->SetBackground(BGColor->GetColor3d("BkgColor").GetData());

    auto Window = vtkSmartPointer<vtkGenericOpenGLRenderWindow>::New();
    Window->AddRenderer(mRenderer);
    setRenderWindow(Window.Get());
}

VtkWidgetP::~VtkWidgetP()
{
}

void VtkWidgetP::updateVisible(bool show)
{
    if(0 < mDomHeader.length() && (mVisibled != 0) != show)
    {
        mVisibled = (show)? 1 : 0;
        setVisible(show);
        dExternalDom::set(mDomHeader + "visible", (mVisibled)? "1" : "0");
    }
}

bool VtkWidgetP::wasVisible() const
{
    return (mVisibled != 0);
}

void VtkWidgetP::repaint()
{
    interactor()->Render();
}

void VtkWidgetP::moveEvent(QMoveEvent* event)
{
    dExternalDom::set(mDomHeader + "pos.x", dString::fromNumber(geometry().x()));
    dExternalDom::set(mDomHeader + "pos.y", dString::fromNumber(geometry().y()));
    QVTKOpenGLNativeWidget::moveEvent(event);
}

void VtkWidgetP::resizeEvent(QResizeEvent* event)
{
    dExternalDom::set(mDomHeader + "size.cx", dString::fromNumber(geometry().size().width()));
    dExternalDom::set(mDomHeader + "size.cy", dString::fromNumber(geometry().size().height()));
    QVTKOpenGLNativeWidget::resizeEvent(event);
}

} // namespace Daddy
