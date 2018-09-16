#!/usr/bin/perl

###########################################################
# table.h generator written by Tim Walkenhorst, Feb 28, 2005. 
sub createTableN {
  $i     = $_[0];
  $args  = "";
  $decls = "";
  $outs  = "";
  $lesss = "";
  $binds = "";
  foreach (1..$i) {
    $args   .= ",TYPE$_,FIELD$_";
    $decls  .= "    TYPE$_ FIELD$_; \\\n";
    $outs   .= "    o << s.FIELD$_ " . ($_!=$i ? " << _TEXT(\", \") ; \\\n" : "; \\\n");
    $lesss  .= "    DTL_LESS (lhs, rhs, FIELD$_); \\\n";
    $binds  .= "      DTL_BIND_FIELD(FIELD$_); \\\n"    
  }
  print FILE <<END;
///////////////////////////////////////////////////////////  
#define DTL_STRUCT$i(STRUCT_NAME$args) \\
  struct STRUCT_NAME { \\
$decls  }; \\
  \\
  dtl::tostream &operator<<(dtl::tostream &o, const STRUCT_NAME &s) \\
  { \\
    o <<  _TEXT("("); \\
$outs    o << _TEXT(")"); \\
    return o; \\
  }; \\
  \\
  bool operator<(const STRUCT_NAME &lhs, const STRUCT_NAME &rhs) { \\
$lesss 	  return false; \\
  } \\
  \\
  BEGIN_DTL_NAMESPACE \\
  template<> class DefaultBCA<STRUCT_NAME> \\
  { \\
  public:\\
    void operator()(BoundIOs &cols, STRUCT_NAME &row) \\
    { \\
$binds    } \\
  };\\
  END_DTL_NAMESPACE

//---------------------------------------------------------  
#define DTL_TABLE$i(TABLE_NAME$args) \\
  DTL_STRUCT$i(TABLE_NAME ## _row$args); \\
  typedef dtl::DBView<TABLE_NAME ## _row> TABLE_NAME ## _view; \\
  TABLE_NAME ## _view TABLE_NAME(_TEXT( #TABLE_NAME ))



END
}


###########################################################
# Main :
if ($#ARGV==2) {
  print STDERR <<END
Syntax: mktabmak FILENAME N 
Example: mktabmak table.h 30
Creates Makros DTL_STRUCT1 to DTL_STRUCT30
           and DTL_TABLE1  to DTL_TABLE30
into Headerfile table.h
END
}
else
{
  $fname  = $ARGV[0];
  $n      = $ARGV[1];
  open FILE , ">$fname";  
  $fname =~ s/[\.]/_/g;
  print FILE <<END;  
#ifndef DTL_$fname
#define DTL_$fname

#include "DTL.h"

#define DTL_LESS(A, B, FIELD) \\
	if ((A.FIELD) < (B.FIELD)) return true; \\
	else if ((A.FIELD) > (B.FIELD)) return false;

#define DTL_BIND_FIELD(FIELD) \\
	cols[_TEXT( #FIELD )] >> row.FIELD

END
  foreach (1..$n) {
    createTableN $_;
  }  
  print FILE "#endif\n";
END
}                

