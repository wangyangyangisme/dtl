# Written for GNU -*- makefile -*-.

include ../config/gcc.inc
MAKEFILEDEPS += ../config/gcc.inc

CC += -march=i686 -mwin32 -DWIN32 -DDTL_CYGWIN -I. 
LDLIBS += -lstdc++ -lodbc32 -lodbccp32

# Windows extensions for executables
EXE = .exe
