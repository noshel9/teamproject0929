SELECT * FROM jspwebmarket.member;
alter table board drop foreign key board_ibfk_1;
select * from information_schema.table_constraints where table_name = 'board';
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
alter table member add count int;

create table uploaddata(
Latitude decimal(21,16) not null,
longitude decimal(21,16) not null,
memo varchar(50) not null,
regidate datetime default(sysdate())
);
-- alter table uploaddata add regidate datetime default(sysdate());
drop table uploaddata;
	
SHOW VARIABLES LIKE 'event%';	
SET GLOBAL event_scheduler = on;
SELECT * FROM information_schema.events;
show events;
drop event uploaddata_reset;

create table board(
num int not null auto_increment,
title varchar(200) not null,
content varchar(2000) not null,
id varchar(10) not null,
postdate date default (current_date),
visitcount int,
foreign key (id) references member(id),
primary key (num)
);

DELIMITER $
CREATE EVENT uploaddata_reset
ON 
SCHEDULE
EVERY 1 DAY STARTS '2022-10-05 06:30:00'
DO 
begin
truncate uploaddata;
    END
    $
    DELIMITER ;