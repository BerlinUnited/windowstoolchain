# WindowsToolChain 2015

Version 0.4  
GCC Version 4.9.3  
Visual Studio 2010  

= Changes from 0.3 =  
 - switched to the GCC 4.9.3 for the crosscompiler tool chain   
 - removed the gmoc and gtest libs  
 - updated to protobuf 4.6.1  
 - updated to opencv 3.1.0  
 
= Changes from 0.2 =  
 - compiled the OpenCV for windows, which fixes some crashes caused by OpenCV  
 - added the Eigen 3.2 library  
 
= Changes from 0.1 =  
 - added toolchain_native/extern/readme.txt with a list of lib-versions  
 - removed toolchain_native/lib_release  
 - replaced toolchain_native/extern/protobuf.lib with a release version which doesn't require a *.pdb file (which caused some warnings)  