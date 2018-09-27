drop database javaee;
create database javaee charset utf8mb4;
 use javaee;

 #drop table user;
 create table user(
   id int auto_increment,
   email char(128) unique ,
   password char(128),
   primary key (id)
 );

select * from javaee.user;