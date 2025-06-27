#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ospray::ospray" for configuration "Release"
set_property(TARGET ospray::ospray APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray )
list(APPEND _cmake_import_check_files_for_ospray::ospray "${_IMPORT_PREFIX}/lib/ospray.lib" "${_IMPORT_PREFIX}/bin/ospray.dll" )

# Import target "ospray::ospray_module_cpu" for configuration "Release"
set_property(TARGET ospray::ospray_module_cpu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_module_cpu PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_module_cpu.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_module_cpu.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_module_cpu )
list(APPEND _cmake_import_check_files_for_ospray::ospray_module_cpu "${_IMPORT_PREFIX}/lib/ospray_module_cpu.lib" "${_IMPORT_PREFIX}/bin/ospray_module_cpu.dll" )

# Import target "ospray::ospray_module_gpu" for configuration "Release"
set_property(TARGET ospray::ospray_module_gpu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_module_gpu PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_module_gpu.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_module_gpu.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_module_gpu )
list(APPEND _cmake_import_check_files_for_ospray::ospray_module_gpu "${_IMPORT_PREFIX}/lib/ospray_module_gpu.lib" "${_IMPORT_PREFIX}/bin/ospray_module_gpu.dll" )

# Import target "ospray::ospray_module_denoiser" for configuration "Release"
set_property(TARGET ospray::ospray_module_denoiser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_module_denoiser PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_module_denoiser.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "OpenImageDenoise;ospray::ospray"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_module_denoiser.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_module_denoiser )
list(APPEND _cmake_import_check_files_for_ospray::ospray_module_denoiser "${_IMPORT_PREFIX}/lib/ospray_module_denoiser.lib" "${_IMPORT_PREFIX}/bin/ospray_module_denoiser.dll" )

# Import target "ospray::ospray_mpi_common" for configuration "Release"
set_property(TARGET ospray::ospray_mpi_common APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_mpi_common PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_mpi_common.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_mpi_common.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_mpi_common )
list(APPEND _cmake_import_check_files_for_ospray::ospray_mpi_common "${_IMPORT_PREFIX}/lib/ospray_mpi_common.lib" "${_IMPORT_PREFIX}/bin/ospray_mpi_common.dll" )

# Import target "ospray::ospray_module_mpi_offload" for configuration "Release"
set_property(TARGET ospray::ospray_module_mpi_offload APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_module_mpi_offload PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_module_mpi_offload.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "rkcommon::rkcommon;ospray::ospray_mpi_common"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_module_mpi_offload.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_module_mpi_offload )
list(APPEND _cmake_import_check_files_for_ospray::ospray_module_mpi_offload "${_IMPORT_PREFIX}/lib/ospray_module_mpi_offload.lib" "${_IMPORT_PREFIX}/bin/ospray_module_mpi_offload.dll" )

# Import target "ospray::ospray_module_mpi_distributed_cpu" for configuration "Release"
set_property(TARGET ospray::ospray_module_mpi_distributed_cpu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_module_mpi_distributed_cpu PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_module_mpi_distributed_cpu.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "rkcommon::rkcommon;ospray::ospray_mpi_common;ospray::ospray_module_cpu"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_module_mpi_distributed_cpu.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_module_mpi_distributed_cpu )
list(APPEND _cmake_import_check_files_for_ospray::ospray_module_mpi_distributed_cpu "${_IMPORT_PREFIX}/lib/ospray_module_mpi_distributed_cpu.lib" "${_IMPORT_PREFIX}/bin/ospray_module_mpi_distributed_cpu.dll" )

# Import target "ospray::ospray_module_mpi_distributed_gpu" for configuration "Release"
set_property(TARGET ospray::ospray_module_mpi_distributed_gpu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_module_mpi_distributed_gpu PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_module_mpi_distributed_gpu.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "rkcommon::rkcommon;ospray::ospray_mpi_common;ospray::ospray_module_gpu"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_module_mpi_distributed_gpu.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_module_mpi_distributed_gpu )
list(APPEND _cmake_import_check_files_for_ospray::ospray_module_mpi_distributed_gpu "${_IMPORT_PREFIX}/lib/ospray_module_mpi_distributed_gpu.lib" "${_IMPORT_PREFIX}/bin/ospray_module_mpi_distributed_gpu.dll" )

# Import target "ospray::ospray_imgui" for configuration "Release"
set_property(TARGET ospray::ospray_imgui APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_imgui PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_imgui.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_imgui.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_imgui )
list(APPEND _cmake_import_check_files_for_ospray::ospray_imgui "${_IMPORT_PREFIX}/lib/ospray_imgui.lib" "${_IMPORT_PREFIX}/bin/ospray_imgui.dll" )

# Import target "ospray::ospray_testing" for configuration "Release"
set_property(TARGET ospray::ospray_testing APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ospray::ospray_testing PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/ospray_testing.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/ospray_testing.dll"
  )

list(APPEND _cmake_import_check_targets ospray::ospray_testing )
list(APPEND _cmake_import_check_files_for_ospray::ospray_testing "${_IMPORT_PREFIX}/lib/ospray_testing.lib" "${_IMPORT_PREFIX}/bin/ospray_testing.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
