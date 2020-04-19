project(blueprint-utilities)

set(_Sources
        ${CMAKE_CURRENT_LIST_DIR}/Include/ax/Builders.h
        ${CMAKE_CURRENT_LIST_DIR}/Include/ax/Drawing.h
        ${CMAKE_CURRENT_LIST_DIR}/Include/ax/Widgets.h
        ${CMAKE_CURRENT_LIST_DIR}/Include/ax/Math2D.h
        ${CMAKE_CURRENT_LIST_DIR}/Include/ax/Math2D.inl
        ${CMAKE_CURRENT_LIST_DIR}/Source/Interop.h
        ${CMAKE_CURRENT_LIST_DIR}/Source/ax/Builders.cpp
        ${CMAKE_CURRENT_LIST_DIR}/Source/ax/Drawing.cpp
        ${CMAKE_CURRENT_LIST_DIR}/Source/ax/Widgets.cpp
)

source_group(TREE ${CMAKE_CURRENT_LIST_DIR} FILES ${_Sources})

add_library(${PROJECT_NAME} STATIC ${_Sources})

get_filename_component(imgui-node-editor_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../proj/cmake" ABSOLUTE)

find_package(imgui-node-editor REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE imgui-node-editor)

target_include_directories(${PROJECT_NAME} PUBLIC  ${CMAKE_CURRENT_LIST_DIR}/Include)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_LIST_DIR}/Source)

set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "Examples/Common")