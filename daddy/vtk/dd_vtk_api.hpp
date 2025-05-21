/// @brief     Definition of vtk-api class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include <daddy.hpp>

namespace Daddy {

/// @brief VTK의 API제공
class dVtkApi
{
public: // Dicom
    DD_handle(dDicom);
    static dDicom openDicom(dLiteral dirpath);
    static dLiteral dicomSpec(dDicom dicom, dLiteral key, dLiteral default_value = "");
};

} // namespace Daddy
