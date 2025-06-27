/// @brief     Definition of vtk-canvas child class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include <daddy.hpp>
#include <QVTKOpenGLNativeWidget.h>
#include <vtkGenericOpenGLRenderWindow.h>
#include <vtkRenderer.h>
#include <vtkVolumeProperty.h>
#include <QMoveEvent>
#include <QResizeEvent>

namespace Daddy {

/// @brief VTK캔버스 하위객체
class VtkWidgetP : public QVTKOpenGLNativeWidget
{
public:
    VtkWidgetP(const dLiteral& domheader);
    virtual ~VtkWidgetP();

public:
    virtual void setDicom(ptr dicom) = 0;

public:
    void updateVisible(bool show);
    bool wasVisible() const;
    void repaint();

protected:
    void moveEvent(QMoveEvent* event) override;
    void resizeEvent(QResizeEvent* event) override;

protected:
    const dString mDomHeader;
    int32_t mVisibled;
    vtkSmartPointer<vtkRenderer> mRenderer;
};

} // namespace Daddy
