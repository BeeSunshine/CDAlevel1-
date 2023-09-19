use test;

--  用户主表
create table userinfo(
	userid varchar(20) not null default '-',
    username varchar(20) not null default '-', 
    gender varchar(4) not null default '-'
);


#导入数据
load data local infile 'D:/liwork/data/UserInfo.txt' 
	into table userinfo
    fields terminated by '\t'
	ignore 1 lines;
    
select * from userinfo;

-- 区域表
create table regioninfo(
	regionid varchar(10) not null default '-',
    regionname varchar(20) not null default '-',    
    regiontype int not null default 0
);

#导入数据
load data local infile 'D:/liwork/data/regioninfo.txt' 
	into table regioninfo
    fields terminated by '\t'
	ignore 1 lines;

select * from regioninfo;

-- 订单主表
create table OrderInfo(
	OrderID varchar(20) not null default '-',
	UserID varchar(20) not null default '-',
    Country int not null default 0,
    Province int not null default 0,
    City int not null default 0,
    District int not null default 0,
    orderamount int not null default 0
);

#导入数据
load data local infile 'D:/liwork/data/OrderInfo.txt' 
	into table OrderInfo
    fields terminated by '\t'
	ignore 1 lines;

select * from OrderInfo;

-- 查询练习
-- 1.求出购买产品金额最多的前十名顾客
select username as 顾客, sum(orderamount) as 金额
from orderinfo left join userinfo on orderinfo.userid = userinfo.userid
group by orderinfo.userid
order by 金额 desc
limit 10;

-- 2.求出购买产品金额最多的前十名顾客的所在城市
select username as 顾客, sum(orderamount) as 金额, regionname as 城市
from orderinfo left join userinfo on orderinfo.userid = userinfo.userid
left join regioninfo on orderinfo.city = regioninfo.regionid
group by orderinfo.userid
order by 金额 desc
limit 10;

-- 3.求出购买力最强的前十个城市
select regionname as 城市, sum(orderamount) as 金额
from orderinfo left join regioninfo on orderinfo.city = regioninfo.regionid
group by city
order by 金额 desc
limit 10;

-- 4.求出购买力最强的前十个城市以及他们所在的省份
-- a.求出购买力最强的前十个城市的中文名称以及这些城市对应的省份id
create table a(
select regionname as 城市, province as 省份id,sum(orderamount) as 金额
from orderinfo left join regioninfo on orderinfo.city = regioninfo.regionid
group by city
order by 金额 desc
limit 10);

select * from a;

-- b.再用a表中的省份id与regioninfo表中的regionid连接，求出省份id对应的省份中文名称
select regionname as 省份, 城市, 金额
from a left join regioninfo on a.省份id = regioninfo.regionid
order by 金额 desc;

-- 用一个含子查询的查询语句可以同时实现以上两步操作
select regionname as 省份, 城市, 金额
from (
select regionname as 城市, province as 省份id,sum(orderamount) as 金额
from orderinfo left join regioninfo on orderinfo.city = regioninfo.regionid
group by city
order by 金额 desc
limit 10 ) as a left join regioninfo on a.省份id = regioninfo.regionid
order by 金额 desc;
 

select regioninfo.* from regioninfo where regionname in ('石家庄', '唐山','广州','深圳','河北','广东');


