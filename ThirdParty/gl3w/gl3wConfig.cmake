project(gl3w)

set(_gl3w_Sources
	${CMAKE_CURRENT_LIST_DIR}/GL/gl3w.h
	${CMAKE_CURRENT_LIST_DIR}/GL/glcorearb.h
	${CMAKE_CURRENT_LIST_DIR}/GL/gl3w.cpp
)

source_group("" FILES ${_gl3w_Sources})

add_library(gl3w STATIC ${_gl3w_Sources})

target_include_directories(gl3w PUBLIC ${CMAKE_CURRENT_LIST_DIR}/GL)

if (UNIX AND (NOT APPLE))
    # Linux: GL is required to pull glXGetProcAddress
    target_link_libraries(gl3w PRIVATE ${CMAKE_DL_LIBS})
endif()

set_property(TARGET gl3w PROPERTY FOLDER "ThirdParty")
