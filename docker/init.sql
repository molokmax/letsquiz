
create database letsquiz;
use letsquiz;
source /db/letsquiz.sql;

create user letsquiz_db identified by "secret";
grant all privileges on letsquiz.* to letsquiz_db@'%';
