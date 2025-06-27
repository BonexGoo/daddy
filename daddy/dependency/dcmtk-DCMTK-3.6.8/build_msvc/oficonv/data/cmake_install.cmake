# Install script for directory: D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/DCMTK")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/charset.pivot.pvdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/mapper.dir;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/mapper.dir.db")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/charset.pivot.pvdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/mapper.dir"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/mapper.dir.db"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/CP/CP936EXT%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/CP/UCS%CP936EXT.mps")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/CP" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/CP/CP936EXT%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/CP/UCS%CP936EXT.mps"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/GB18030%UCS@BMP.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/GB2312%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/GB2312EXT%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/GB2312GBK%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/GB2312UDA1%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/GB2312UDA2%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/GBKEXT%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/GBKUDA%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/UCS%GB2312.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/UCS%GB2312EXT.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/UCS%GB2312UDA1.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/UCS%GB2312UDA2.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/UCS%GBKEXT.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/UCS%GBKUDA.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB/UCS@BMP%GB18030.mps")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/GB" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/GB18030%UCS@BMP.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/GB2312%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/GB2312EXT%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/GB2312GBK%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/GB2312UDA1%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/GB2312UDA2%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/GBKEXT%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/GBKUDA%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/UCS%GB2312.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/UCS%GB2312EXT.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/UCS%GB2312UDA1.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/UCS%GB2312UDA2.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/UCS%GBKEXT.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/UCS%GBKUDA.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/GB/UCS@BMP%GB18030.mps"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-11%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-15%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-2%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-3%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-4%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-5%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-6%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-7%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-8%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/ISO-8859-9%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-11.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-15.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-2.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-3.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-4.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-5.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-6.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-7.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-8.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859/UCS%ISO-8859-9.mps")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO-8859" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-11%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-15%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-2%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-3%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-4%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-5%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-6%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-7%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-8%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/ISO-8859-9%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-11.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-15.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-2.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-3.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-4.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-5.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-6.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-7.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-8.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO-8859/UCS%ISO-8859-9.mps"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO646/ISO646-JP%UCS.646;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO646/ISO646-US%UCS.646")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/ISO646" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO646/ISO646-JP%UCS.646"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/ISO646/ISO646-US%UCS.646"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/JIS/JISX0201-KANA%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/JIS/JISX0208@1990%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/JIS/JISX0212%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/JIS/UCS%JISX0201-KANA.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/JIS/UCS%JISX0208@1990.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/JIS/UCS%JISX0212.mps")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/JIS" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/JIS/JISX0201-KANA%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/JIS/JISX0208@1990%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/JIS/JISX0212%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/JIS/UCS%JISX0201-KANA.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/JIS/UCS%JISX0208@1990.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/JIS/UCS%JISX0212.mps"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/KS/KSC5601HANGUL%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/KS/KSC5601HANJA%UCS.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/KS/UCS%KSC5601HANGUL.mps;C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/KS/UCS%KSC5601HANJA.mps")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/csmapper/KS" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/KS/KSC5601HANGUL%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/KS/KSC5601HANJA%UCS.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/KS/UCS%KSC5601HANGUL.mps"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/csmapper/KS/UCS%KSC5601HANJA.mps"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/esdb.alias.db;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/esdb.dir.db")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/esdb.alias.db"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/esdb.dir.db"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/EUC/EUC-CN.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/EUC/EUC-KR.esdb")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/EUC" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/EUC/EUC-CN.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/EUC/EUC-KR.esdb"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/GB/GB18030.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/GB/GBK.esdb")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/GB" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/GB/GB18030.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/GB/GBK.esdb"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-1.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-11.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-15.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-2.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-3.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-4.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-5.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-6.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-7.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-8.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859/ISO-8859-9.esdb")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO-8859" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-1.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-11.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-15.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-2.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-3.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-4.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-5.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-6.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-7.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-8.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO-8859/ISO-8859-9.esdb"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO646/ISO646-US.esdb")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/ISO646" TYPE FILE FILES "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/ISO646/ISO646-US.esdb")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/MISC/JISX0201-KANA.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/MISC/JISX0208@1990.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/MISC/JISX0212.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/MISC/Shift_JIS.esdb")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/MISC" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/MISC/JISX0201-KANA.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/MISC/JISX0208@1990.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/MISC/JISX0212.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/MISC/Shift_JIS.esdb"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "data" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-16-INTERNAL.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-16-SWAPPED.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-16.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-16BE.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-16LE.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-32-INTERNAL.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-32-SWAPPED.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-32.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-32BE.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-32LE.esdb;C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF/UTF-8.esdb")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Program Files/DCMTK/share/dcmtk-3.6.8/esdb/UTF" TYPE FILE FILES
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-16-INTERNAL.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-16-SWAPPED.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-16.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-16BE.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-16LE.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-32-INTERNAL.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-32-SWAPPED.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-32.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-32BE.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-32LE.esdb"
    "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/oficonv/data/esdb/UTF/UTF-8.esdb"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/cybermed/daddy/dependency/dcmtk-DCMTK-3.6.8/build_msvc/oficonv/data/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
