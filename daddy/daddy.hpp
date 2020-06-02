#pragma once

#include "core/dd_binary.hpp"
#include "core/dd_detector.hpp"
#include "core/dd_escaper.hpp"
#include "core/dd_global.hpp"
#include "core/dd_handle.hpp"
#include "core/dd_macro.hpp"
#include "core/dd_markup.hpp"
#include "core/dd_platform.hpp"
#include "core/dd_string.hpp"
#include "core/dd_telepath.hpp"
#include "core/dd_thread.hpp"
#include "core/dd_type.hpp"
#include "core/dd_unique.hpp"
#include "core/dd_zoker.hpp"

#if DD_OS_WINDOWS & !defined(DD_DISABLE_LIB)
    #pragma comment(lib, "daddy.lib")
#endif

using namespace Daddy;
