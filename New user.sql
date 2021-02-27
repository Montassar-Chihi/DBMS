alter session set "_ORACLE_SCRIPT"=true;
CREATE USER Elmonta IDENTIFIED BY "1234";
GRANT CONNECT TO Elmonta;
GRANT CONNECT, RESOURCE, DBA TO Elmonta;
grant create session to Elmonta;
grant all privileges to Elmonta;
grant unlimited tablespace to Elmonta;
