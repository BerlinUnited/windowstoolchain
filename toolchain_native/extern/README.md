## How to compile lua
I used the guide from https://blog.spreendigital.de/2019/06/25/how-to-compile-lua-5-3-5-for-windows/

They suggest to do:
```
cl /MD /O2 /c /DLUA_BUILD_AS_DLL *.c
ren lua.obj lua.o
ren luac.obj luac.o
link /DLL /IMPLIB:lua5.3.5.lib /OUT:lua5.3.5.dll *.obj
link /OUT:lua.exe lua.o lua5.3.5.lib
lib /OUT:lua5.3.5-static.lib *.obj
link /OUT:luac.exe luac.o lua5.3.5-static.lib
```

but I did:
```
cl /MD /O2 /c  *.c
ren lua.obj lua.o
ren luac.obj luac.o
link /LIB /OUT:lua5.3.5.lib *.obj
```

## OUTDATED - FIXME
Following external libraries are included in this package:
--------------------
glib-2.0  2.26.1
protobuf  3.4.1
opencv    3.1.0
sfsexp    1.2.1
Eigen     3.3.4

NOTE: the libraries are compiled with Visual Studio 2013 and /MDd