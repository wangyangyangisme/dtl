include (../variables.pri)

TARGET = DTL
DESTDIR=../lib
TEMPLATE = lib

CONFIG += dll

HEADERS += \
   array_string.h \
   bind_basics.h \
   BoundIO.h \
   Callback.h \
   clib_fwd.h \
   CountedPtr.h \
   date_util.h \
   DB_Base.h \
   DB_iterator.h \
   DBConnection.h \
   DBDefaults.h \
   DBException.h \
   DBIndex.h \
   DBStmt.h \
   DBView.h \
   delete_iterator.h \
   DTL.h \
   dtl_algo.h \
   dtl_base_types.h \
   dtl_config.h \
   dtl_enum.h \
   dtl_set.h \
   DynaDBView.h \
   IndexedDBView.h \
   insert_iterator.h \
   LocalBCA.h \
   merant.h \
   minimax.h \
   nullable.h \
   random_select_iterator.h \
   random_select_update_iterator.h \
   RandomDBView.h \
   RootException.h \
   select_insert_iterator.h \
   select_iterator.h \
   select_update_iterator.h \
   sql_iterator.h \
   starit.h \
   std_warn_off.h \
   std_warn_on.h \
   string_util.h \
   table.h \
   unix_tchar.h \
   update_iterator.h \
   validate.h \
   variant_row.h \
   VariantException.h \
   vec_multiset.h \

SOURCES += \
   bind_basics.cpp \
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
   VariantException.cpp \

