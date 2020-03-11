/// @brief     Definition of base types.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_type.hpp"

// Dependencies
#if DD_OS_WINDOWS
	#include <windows.h>
#else
#endif

namespace Daddy {

void DD_crash()
{
	#if DD_OS_WINDOWS & !DD_OS_WINDOWS_MINGW
		DebugBreak();
	#else
		__builtin_trap();
	#endif
}

} // namespace Daddy
