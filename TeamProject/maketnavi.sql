select * from member;
select * from uploaddata;

create table member(
id varchar(10) not null,
pass varchar(10) not null,
name varchar(30) not null,
addr varchar(50) not null,
tel varchar(10) not null,
regidate datetime default(sysdate()),
primary key (id)
);
alter table member add count varchar(10);

create table uploaddata(
Latitude decimal(16,16) not null,
longitude decimal(16,16) not null,
memo varchar(50) not null
);
