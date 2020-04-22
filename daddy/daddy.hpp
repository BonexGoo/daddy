/*!
\mainpage daddy
\section information 목적
    - 컴포넌트식 네트워크 서버엔진
\section advanced 소개
    - core: 기반기술
    - toolkit: 지원프로그램
\section developer 개발자
    - BonexGoo
\section contact 연락처
    - bonexgoo@gmail.com
    - +82-10-2030-0288
*/
#pragma once

#include "core/dd_binary.hpp"
#include "core/dd_detector.hpp"
#include "core/dd_escaper.hpp"
#include "core/dd_global.hpp"
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
