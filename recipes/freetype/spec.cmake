set(DEP_VERSION 2.14.1)

set(DEP_SOURCE_URL    "https://download.savannah.gnu.org/releases/freetype/freetype-2.14.1.tar.xz")
set(DEP_SOURCE_SHA256 "32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc")

set(DEP_CMAKE_ARGS
    ${DEP_CMAKE_ARGS}
    -DBUILD_SHARED_LIBS=ON
    -DFT_DISABLE_ZLIB=TRUE
    -DFT_DISABLE_BZIP2=TRUE
    -DFT_DISABLE_PNG=TRUE
    -DFT_DISABLE_HARFBUZZ=TRUE
    -DFT_DISABLE_BROTLI=TRUE
)

if (IOS)
    message (STATUS "freetype/meta.cmake CMAKE_OSX_SYSROOT: ${CMAKE_OSX_SYSROOT}")

    set(APPLE TRUE)
    if(CMAKE_OSX_SYSROOT MATCHES "imulator")
        set(IOS_PLATFORM "SIMULATOR")
    elseif(CMAKE_OSX_SYSROOT MATCHES "phone")
        set(IOS_PLATFORM "OS")
    endif()
        
    set(DEP_CMAKE_ARGS
        ${DEP_CMAKE_ARGS}
        -DBUILD_SHARED_LIBS=OFF
        -DAPPLE=1
        -DIOS_PLATFORM=${IOS_PLATFORM}
    )

#   message (FATAL_ERROR "Stop in the name of befuddlement!")

else()
   message (FATAL_ERROR "<weary sigh> Why is IOS off?")

endif()

message (STATUS "freetype/spec.cmake DEP_CMAKE_ARGS: ${DEP_CMAKE_ARGS}")

set(DEP_LICENSE_FILES LICENSE.TXT)
