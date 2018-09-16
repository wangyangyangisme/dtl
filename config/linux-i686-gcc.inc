# Written for GNU -*- makefile -*-.

include ../config/gcc.inc
MAKEFILEDEPS += ../config/gcc.inc

# -frepo compiles much faster but can have link problems.  See the info
# page for GCC for details.  This option is not (yet) usable on Cygwin.

# For Linux assume we are using a case sensitive MySQL database 
# - force all queries to be uppper case
# Assume bulk fetch is supported, this requires MyODBC 3.51 or higher.
CFLAGS += -DDTL_UC  

# Disable bulk fetch
#CFLAGS += -DDTL_NO_BULK_OPERATIONS

# For some of our internal projects we need to manually define UNIX
# Also, we need to tell unixODBC that gcc supports the "long long" data type
CFLAGS += -DUNIX -DHAVE_LONG_LONG -I/usr/local/include

include ../config/unixODBC.inc
MAKEFILEDEPS += ../config/unixODBC.inc
