set(DEP_TARGET png::png)
if (IOS)
    set(DEP_LIBS Qt6BundledLibpng)
else()
	set(DEP_LIBS png16)
endif()
set(DEP_LIBS_WINDOWS libpng16)
set(DEP_SYSTEM_HEADER QTPng/png.h)

if(DEP_STATIC)
    list(APPEND DEP_CMAKE_ARGS
        -DBUILD_SHARED_LIBS=OFF
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    )
    list(APPEND DEP_LINK_DEPS png::png)
endif()
