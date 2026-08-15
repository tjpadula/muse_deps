if(IOS)
    set(DEP_TARGET harfbuzz)
    set(DEP_SYSTEM_HEADER QtHarfbuzz/harfbuzz/hb.h)
    set(DEP_LIBS libQt6BundledHarfbuzz)
    set(DEP_INCLUDE_SUBDIRS "")
else()
	set(DEP_TARGET harfbuzz::harfbuzz)
	set(DEP_LIBS harfbuzz)
	set(DEP_INCLUDE_SUBDIRS harfbuzz)
	set(DEP_SYSTEM_HEADER harfbuzz/hb-ft.h)
endif()

if(DEP_STATIC)
    list(APPEND DEP_CMAKE_ARGS
        -DBUILD_SHARED_LIBS=OFF
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    )
	if(IOS)
		list(APPEND DEP_LINK_DEPS freetype)
	else()
		list(APPEND DEP_LINK_DEPS freetype::freetype)
	endif()
endif()
