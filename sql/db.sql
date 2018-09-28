drop database javaee;
create database javaee charset utf8mb4;
 use javaee;

 #drop table user;
 create table user(
   id int auto_increment,
   email char(128) unique ,
   username char(255) default 0,
   password char(128) not null ,
   primary key (id)
 );


create table book(
  id int auto_increment primary key comment 'ID PK',
  title char(255) not null comment '标题 NN',
  author char(128) not null  comment '作者',
  date date default '2000-01-01' comment '入库日期 DF 2000-01-01',
  price double not null  comment '图书价格 NN',
  amount int not null  comment '图书数量 NN'
);

select * from javaee.book order by id desc;
