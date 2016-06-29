SET FEEDBACK OFF
SET VERIFY OFF
SET HEAD OFF
SET TERMOUT OFF

COLUMN RUN_TIME NEW_VALUE RUN_TIME
COLUMN GLOBAL_NAME NEW_VALUE GLOBAL_NAME

SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') AS run_time,
       global_name
  FROM global_name;

SPOOL exec_all.&run_time

SET TERMOUT ON
CLEAR SCREEN

PROMPT ################################################################################
SELECT ' INSTANCE: &global_name'||CHR(10)||' STARTING: '||
            TO_CHAR(SYSDATE, 'DD-MON-YYYY HH:MI:SS AM') FROM dual;
PROMPT ################################################################################

PROMPT
PROMPT 
PROMPT ================================================================================
PROMPT  THIS SCRIPT BUILDS THE DEMO APPLICATION.
PROMPT ================================================================================
PROMPT
PROMPT

PROMPT CONNECTING TO SYS SCHEMA…
CONN sys/oracle@&global_name

PROMPT
PROMPT 
PROMPT ================================================================================
PROMPT  SETTING UP...
PROMPT ================================================================================
@@./pre.sql
PROMPT DONE.

PROMPT
PROMPT 
PROMPT ================================================================================
PROMPT  BUILDING BOOKS TABLE...
PROMPT ================================================================================
@@./tables/books.sql
PROMPT DONE.

PROMPT
PROMPT 
PROMPT ================================================================================
PROMPT  BUILDING BOOKS API...
PROMPT ================================================================================
@@./packages/books_api.sql
PROMPT DONE.

PROMPT
PROMPT 
PROMPT ================================================================================
PROMPT  TEARING DOWN...
PROMPT ================================================================================
@@./post.sql
PROMPT DONE.

PROMPT
PROMPT 
PROMPT ################################################################################
SELECT ' FINISHED: '||TO_CHAR(SYSDATE, 'DD-MON-YYYY HH:MI:SS AM') FROM dual;
PROMPT
PROMPT ################################################################################

SPOOL OFF


