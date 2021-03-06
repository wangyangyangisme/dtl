
CREATE TABLE DB_EXAMPLE ( 
  INT_VALUE     INTEGER NOT NULL, 
  STRING_VALUE  VARCHAR(50), 
  DOUBLE_VALUE  FLOAT, 
  EXAMPLE_LONG  INTEGER, 
  EXAMPLE_DATE  TIMESTAMP ) ; 

CREATE TABLE DB_EXAMPLE_BACKUP ( 
  INT_VALUE     INTEGER NOT NULL, 
  STRING_VALUE  VARCHAR(50), 
  DOUBLE_VALUE  FLOAT, 
  EXAMPLE_LONG  INTEGER, 
  EXAMPLE_DATE  TIMESTAMP ) ; 

CREATE TABLE DB_SAMPLE ( 
  SAMPLE_LONG  INTEGER, 
  SAMPLE_INT   INTEGER, 
  SAMPLE_STR   VARCHAR(50), 
  EXTRA_FLOAT  FLOAT ) ; 

CREATE TABLE DB_LONGSTR ( 
  INT_VALUE     INTEGER NOT NULL, 
  STRING_VALUE  VARCHAR(1500), 
  DOUBLE_VALUE  FLOAT, 
  EXAMPLE_LONG  INTEGER, 
  EXAMPLE_DATE  TIMESTAMP ) ;

CREATE TABLE LONG_EXAMPLE (
  STRING_VALUE VARCHAR(2500)
);