# Written for GNU -*- makefile -*-.

# GCC_EXEC_PREFIX="C:\cygwin\usr\local\libexec\gcc\i686-pc-cygwin\3.4.0"

CC = c++ # get the right linker
CFLAGS += -Wall -Wshadow
LDFLAGS += $(CFLAGS)

ifneq (,$(findstring release,$(BUILD)))
# Optimize for size.  See various Internet discussions about why this
# can give better performance than -O3, mostly having to do with CPU
# cache.
CFLAGS += -Os -g0 -fomit-frame-pointer
else
ifneq (,$(findstring debug,$(BUILD)))
CFLAGS += -O0 -g3
else
ifneq (,$(findstring profile,$(BUILD)))
# For some reason CFLAGS isn't picked up here by LINK
CC += -pg
CFLAGS += -pg
else
$(error unknown BUILD: $(BUILD))
endif
endif
endif

# Magic for auto-dependencies.  See
# <http://make.paulandlesley.org/autodep.html>
# See autodep.html in the dtl/docs directory for a copy of this page
d_file = $(BUILD)/$(*F).d
P_file = $(BUILD)/$(*F).P

$(BUILD)/%.o: %.cpp
	$(COMPILE.cpp) -MMD $(OUTPUT_OPTION) $<
	@cp $(d_file) $(P_file); \
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
      -e '/^$$/ d' -e 's/$$/ :/' < $(d_file) >> $(P_file); \
	$(RM) $(d_file)

-include $(SOURCES:%.cpp=$(BUILD)/%.P)

