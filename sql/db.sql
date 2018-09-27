 create database javaee;
 use javaee;

 create table user(
   id int auto_increment,
   email char(128) ,
   password char(128),
   primary key (id,email)
 );

