BORLAND_PATH = C:\Borland\BCC55
DEFS = -I..\lib -DWIN32
CC = $(BORLAND_PATH)\Bin\bcc32.exe
LINK = $(BORLAND_PATH)\Bin\ILINK32.EXE

!ifndef BMODE
BMODE = DEBUG
!endif

!if $(BMODE) != RELEASE && $(BMODE) != DEBUG
!  error Illegal value for BMODE option
!endif

CPPFLAGS = -w-8027 -w-8026 -w-8057 -w-8022 -w-8004 -w-8008 -tWC -tWM 
LDFLAGS  = -q -ap -Gn -L$(BORLAND_PATH)\lib\PSDK;..\lib

!if $(BMODE) == RELEASE
	DEFS=-DNDEBUG $(DEFS)
	CPPFLAGS=$(DEFS) -v- -O1 -k- $(CPPFLAGS)
	LDFLAGS= -v- -x $(LDFLAGS)
	!message Building release version of project
!else
	DEFS=-D_DEBUG $(DEFS)
	CPPFLAGS=$(DEFS) -v -vi- -Od -k -R -Q -M -y -r- $(CPPFLAGS)
	LDFLAGS= -v -m -M $(LDFLAGS)
	!message Building debug version of project
!endif

OBJECTS =  SpecialQryExample.obj ShareConn.obj StoredProc.obj \
range.obj ReadDataNoMatches.obj example_core.obj WriteData.obj \
SimpleDynamicRead.obj ReadJoinedData.obj ReadData.obj  \
DynamicIndexedViewExample.obj example.obj main.obj IndexedViewExample.obj CStringExample.obj GlobalHandler.obj

all: example

clean:
	-@if exist *.obj del *.obj                 >nul 
	-@if exist example.exe del example.exe    >nul


example: $(OBJECTS) $(DEPENDENCIES)
	$(LINK) $(LDFLAGS) c0x32.obj $(OBJECTS), example, , CW32mt.LIB IMPORT32.LIB

# Build rules    
.cpp.obj:
      @$(CC) $(CPPFLAGS) -I$(INCDIR) /c $<

.rc.res:
      @echo Compiling $(<F)
      @$(RC) $(RFLAGS) -fo$@ $< > NUL:
