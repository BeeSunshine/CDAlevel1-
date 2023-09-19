-- 使用数据库
use test;

-- 创建fruits数据表
create table fruits(
	f_id char(10) not null,
	s_id int not null,
	f_name varchar(255) not null,
	f_price decimal(8,2) not null,
	primary key(f_id)
);

-- 插入数据
insert into fruits(f_id,s_id,f_name,f_price)
values('a1',101,'apple',5.2),
('b1',101,'blackberry',10.2),
('bs1',102,'orange',11.2),
('bs2',105,'melon',8.2),
('t1',102,'banana',10.3),
('t2',102,'grape',5.3),
('o2',103,'coconut',9.2),
('c0',101,'cherry',3.2),
('a2',103,'apricot',25.2),
('l2',104,'lemon',6.4),
('b2',104,'berry',7.6),
('m1',106,'mango',15.6),
('m2',105,'xbabay',2.6),
('t4',107,'xbababa',3.6),
('b5',107,'xxxx',3.6);

select * from fruits;

-- 创建大气质量表
create table Monthly_Indicator(
	city_name varchar(20) not null,
    month_key date not null,
    aqi int(4) not null default 0,
    aqi_range varchar(20) not null default '-',
    air_quality varchar(20) not null default '-',
    pm25 float(6,2) not null default 0,
    pm10 float(6,2) not null default 0,
    so2 float(6,2) not null default 0,
    co float(6,2) not null default 0,
    no2 float(6,2) not null default 0,
    o3 float(6,2) not null default 0,
    ranking int(4) not null default 0,
    primary key(city_name,month_key)
    );
    
-- 为Monthly_Indicator表导入外部txt文件
load data local infile 'D:/liwork/CDA/MySQL - Li Qi/data/all.txt' 
	into table Monthly_Indicator 
    fields terminated by '\t'
    ignore 1 lines;
    
-- 检查倒入内容Monthly_Indicator
Select * from Monthly_Indicator;

-- 检查导入数据总行数Monthly_Indicator
Select count(*) from Monthly_Indicator;

-- 检查表结构
Desc Monthly_Indicator;