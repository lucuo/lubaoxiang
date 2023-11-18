CMAKE_MINIMUM_REQUIRED(VERSION 2.8.10 FATAL_ERROR)

SET(PROJECT_NAME compiler_options)
PROJECT(${PROJECT_NAME})
ENABLE_LANGUAGE(Fortran)

IF(release_type)
	SET(CMAKE_BUILD_TYPE Release CACHE STRING "" FORCE)
ELSE()
	SET(CMAKE_BUILD_TYPE Debug CACHE STRING "" FORCE)
ENDIF()
MESSAGE(===== BUILD_TYPE: ${CMAKE_BUILD_TYPE})

IF(MSVC_IDE)
   SET(Fortran_FLAGS         " /stand:f03 /threads")
   SET(Fortran_FLAGS_DEBUG   " /debug:full /warn:all /check:bounds /check:uninit /traceback")
   SET(Fortran_FLAGS_RELEASE " /O3 ")
ELSEIF("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    SET(CMAKE_Fortran_FLAGS         " -std=f2008 -mthreads" )
    SET(CMAKE_Fortran_FLAGS_DEBUG   " -g -Wall -fcheck=pointer,bounds -fbacktrace")
    SET(CMAKE_Fortran_FLAGS_RELEASE  " -Ofast")
ENDIF()

ADD_SUBDIRECTORY(src)

ENABLE_TESTING()
ADD_SUBDIRECTORY(test)

FILE(COPY doc DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

