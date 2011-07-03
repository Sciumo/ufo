UFO is a LuaJIT binary distribution with several precompiled "C" libraries, and FFI bindings.

The following bindings (and for some precompiled dynamic libraries) are included:
    - OpenGL
    - OpenCL
    - glu
    - glfw
    - zmq
    - AntTweakBar
    - cairo
    - pixman
	
LuaJIT FFI bindings for OpenCL, OpenGL, glu, glfw, AntTweakBar and ZeroMQ

You can try the examples from the command-line:
  luajit demo.lua           -- Simple demo showing couple of libraries in action
  luajit OpenCL-demo.lua    -- Work in progress
  luajit OpenCL-info.lua    -- Dumps OpenCL info to the console
  luajit OpenCL-info-tw.lua -- Shows OpenCL info using OpenGL and AntTweakBar
  luajit glfw-triangle.lua  -- Example from GLFW showing simple trianlge
  luajit glfw-boing.lua     -- Example from GLFW with some Amiga roots (there is a slight bug)

Dimiter "malkia" Stanev
malkia@gmail.com
  