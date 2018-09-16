#######################################################
# MAKEFILE for building DTL(d).lib                    #
#                                                     #
#                                                     #
# (c) 2005 by Darko Miletic                           #
# e-mail: darko@uvcms.net                             # 
#######################################################
.autodepend

#BCCROOT=C:\bcb6\Bin
BCCROOT=C:\Progra~1\Borland\CBuilder6\Bin
ILINK32=$(BCCROOT)\ilink32
LB=$(BCCROOT)\tlib
CC=$(BCCROOT)\bcc32
RC=$(BCCROOT)\brcc32

!ifndef BMODE
BMODE = DEBUG
!endif

!if $(BMODE) != RELEASE && $(BMODE) != DEBUG
!  error Illegal value for BMODE option
!endif

PROJECT=$(PROJECT1)
SYSDEFINES=WIN32;_LIB;DTL_LIBRARY_BUILD
OUTDIR=.
CPPFLAGS=-q -6 -tWD -RT -x -a8 -b -X- -w-aus -w-sus -w-pia -w-rch -w-ccc -w-eff -w-par -w-hid -w-inl -D$(USERDEFINES);$(SYSDEFINES)

!if $(BMODE) == RELEASE
	CPPFLAGS=-v- -O1 -k- $(CPPFLAGS)
	DBG=
	USERDEFINES=NDEBUG
	OBJDIR=bcc\Release
	LPARAMS=/P64 /0
	!message Building release version of project
!else
	CPPFLAGS=-v -vi- -Od -k -R -Q -M -y -r- $(CPPFLAGS)
	DBG=d
	USERDEFINES=_DEBUG
	OBJDIR=bcc\Debug
	LPARAMS=/P128
	!message Building debug version of project
!endif


LIBNAME=dtl$(DBG)bcb6.lib
INCDIR=. 
SRC=.
OBJ=.\$(OBJDIR)
BIN=.\$(OUTDIR)
.path.obj=$(OBJ)

################################
# Target
################################
PROJECT1=$(BIN)\$(LIBNAME)
CPPFILES=VariantException.cpp \ 
         BoundIO.cpp \ 
         clib_fwd.cpp \ 
         CountedPtr.cpp \ 
         date_util.cpp \ 
         DB_Base.cpp \ 
         DBConnection.cpp \ 
         DBException.cpp \ 
         DBStmt.cpp \ 
         DBView.cpp \ 
         dtl_base_types.cpp \ 
         LocalBCA.cpp \ 
         RootException.cpp \ 
         string_util.cpp \ 
         validate.cpp \ 
         variant_row.cpp \ 
         bind_basics.cpp 

CPPOBJFILES=$(CPPFILES:.cpp=.obj ^ )
OBJFILES=$(CPPOBJFILES)
LIBFILES=ODBC32.LIB UUID.LIB
ALLOBJS=$(BCC32STARTUP) $(OBJFILES)

all: dirs $(RESFILE) $(PROJECT)

cleanobj:: 
	-@echo Deleting intermediate files for project
	-@if exist $(OBJ)\*.obj del $(OBJ)\*.obj
	-@if exist $(OBJ)\*.res del $(OBJ)\*.res
	-@if exist $(OBJ)\. rd $(OBJ)
!if $(BMODE) == RELEASE
	-@if exist $(BIN)\*.tds del $(BIN)\*.tds
	-@if exist $(BIN)\*.map del $(BIN)\*.map
!endif

cleantgt::
	-@echo Deleting output files for project
	-@if exist $(PROJECT) del $(PROJECT)

clean: cleanobj cleantgt

dirs::
	-@echo Creating output directory
	-@if not exist bcc md bcc
	-@if not exist $(OBJ) md $(OBJ)
	-@if not exist $(BIN) md $(BIN)

##################################
# Output
##################################
$(PROJECT1):: $(OBJFILES)
   -@if exist $< del $<
   @echo Linking $(<F) static library
   @$(LB) $< $(LPARAMS) @&&|
   +$(?: = &^
   +)
   
| > NUL:


# Build rules    
.cpp.obj:
      @$(CC) $(CPPFLAGS) -I$(INCDIR) -n$(OBJ) /c $<

.rc.res:
      @echo Compiling $(<F)
      @$(RC) $(RFLAGS) -fo$@ $< > NUL:
