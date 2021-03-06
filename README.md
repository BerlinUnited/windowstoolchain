# WindowsToolChain

Version 2020-04-29
GCC Version 4.9.3  
Visual Studio 2013  
LLVM 9.0.0

- added support for clang for compiling the code for the nao

## older version

Version 0.9  
GCC Version 4.9.3  
Visual Studio 2013  

= Changes from 0.8 =  
 - use premake5
 - added Whistledetector libs  
 - updated protobuf to version 3.4.1
 - deleted unused protobuf lite
 - added protobuf pdb files for vs2013  
 - added eigen 3.3.4


= Changes from 0.4 =  
 - fixed typo in protobuf version in last changelog  
 - recompiled protobuf with Visual Studio 2013 - only replace protoc.exe and protobuf.lib   
   the protobuf-lite.lib is not yet replaced  
 - compiled premake repo as it was on 2016-09-05 and used that binary  
   not need to change our premake files  
   
   = Note: Flags needed for compiling OpenCV =   
        WITH_VTK:BOOL=0  
        BUILD_OPENEXR:BOOL=0  
        OPENCV_HAL_HEADERS:STRING=  
        BUILD_opencv_world:BOOL=0  
        BUILD_DOCS:BOOL=0  
        OPENCL_FOUND:BOOL=0  
        CMAKE_BUILD_TYPE:STRING=Debug  
        BUILD_opencv_ts:BOOL=0  
        BUILD_PERF_TESTS:BOOL=0  
        WITH_OPENCLAMDFFT:BOOL=0  
        WITH_CUDA:BOOL=0  
        WITH_MATLAB:BOOL=0  
        WITH_OPENEXR:BOOL=0  
        WITH_IPP:BOOL=0  
        WITH_OPENCL:BOOL=0  
        WITH_OPENCLAMDBLAS:BOOL=0  
        OPENCV_HAL_LIBS:STRING=  
        BUILD_PACKAGE:BOOL=1  
        BUILD_TESTS:BOOL=0  
        WITH_EIGEN:BOOL=0  
        WITH_CUFFT:BOOL=0     
   
 
= Changes from 0.3 =  
 - switched to the GCC 4.9.3 for the crosscompiler tool chain   
 - removed the gmoc and gtest libs  
 - updated to protobuf 2.6.1  
 - updated to opencv 3.1.0  
 
= Changes from 0.2 =   
 - compiled the OpenCV for windows, which fixes some crashes caused by OpenCV  
 - added the Eigen 3.2 library  

= Changes from 0.1 =  
 - added toolchain_native/extern/readme.txt with a list of lib-versions  
 - removed toolchain_native/lib_release  
 - replaced toolchain_native/extern/protobuf.lib with a release version which doesn't require a *.pdb file (which caused some warnings)  