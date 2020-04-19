if( NOT TARGET imgui-node-editor )
  get_filename_component( imgui_node_editor_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )

  # Define ${CINDER_PATH} as usual.
  get_filename_component(CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE)

  file(GLOB imgui_node_editor_SOURCES CONFIGURE_DEPEND
          "${imgui_node_editor_SOURCE_PATH}/NodeEditor/Source/**.cpp"
          "${imgui_node_editor_SOURCE_PATH}/NodeEditor/Source/**.inl"
  )

  add_library( imgui-node-editor ${imgui_node_editor_SOURCES} )

  target_include_directories( imgui-node-editor PUBLIC
          "${imgui_node_editor_SOURCE_PATH}/NodeEditor/Include")
  target_include_directories( imgui-node-editor PUBLIC
	  "${imgui_node_editor_SOURCE_PATH}/Examples/Common/Application/Include")
  target_include_directories( imgui-node-editor PRIVATE
          "${imgui_node_editor_SOURCE_PATH}/NodeEditor/Source")

  target_include_directories( imgui-node-editor SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include")
  if(NOT TARGET cinder)
      include("${CINDER_PATH}/proj/cmake/configure.cmake")
      find_package(cinder REQUIRED PATHS
              "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
              "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
  endif()
  target_link_libraries(imgui-node-editor PRIVATE cinder)

  # Add includes for DXSDK, gl3w, ScopeGuard, and stb_image
  include("${imgui_node_editor_SOURCE_PATH}/Examples/Common/BlueprintUtilities/CMakeLists.txt")
  include("${imgui_node_editor_SOURCE_PATH}/Examples/Common/Application/CMakeLists.txt")

endif()
