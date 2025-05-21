/// @brief     Definition of vtk-api class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_api.hpp"
#if DD_OS_WASM

// Dependencies

namespace Daddy {

dVtkApi::dDicom dVtkApi::openDicom(dLiteral dirpath)
{
    return dDicom();
}

dLiteral dVtkApi::dicomSpec(dDicom dicom, dLiteral key, dLiteral default_value)
{
    return default_value;
}

} // namespace Daddy

#endif // DD_OS_WASM
