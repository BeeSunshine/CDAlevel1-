-- 使用数据库
use test;

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
    
-- SQL语句单表查询练习
-- 查询大气质量表中的全部内容
select * from monthly_indicator;

-- 查询北京的大气质量数据
select * from monthly_indicator
where city_name = '北京';

-- 查询不同月份PM2.5的最大值
select month_key, max(pm25) from monthly_indicator
group by month_key;

-- 降序查询不同城市PM10的平均值
select city_name, avg(pm10) from monthly_indicator
group by city_name
order by avg(pm10) desc;

-- 对大气质量表进行有选择的查询
select city_name, avg(pm25), avg(pm10) from Monthly_Indicator
where pm25 > 50
group by city_name, month_key having city_name <> '北京'
order by avg(pm25) desc;

-- 多表连接练习
-- 创建学员信息表
create table 学员信息表(
	学号 varchar(5),
    学员姓名 varchar(10),
    年龄 int
);

-- 为学员信息表导入数据
load data local infile 'D:/liwork/SQL/data/xyxx.csv' 
	into table 学员信息表
    fields terminated by ','
    ignore 1 lines;

-- 创建学员成绩表
create table 学员成绩表(
	学号 varchar(5),
    成绩 int
);

-- 为学员成绩表导入数据
load data local infile 'D:/liwork/SQL/data/xycj.csv' 
	into table 学员成绩表
    fields terminated by ','
    ignore 1 lines;

-- 内连接
select 学员信息表.*, 学员成绩表.* 
from 学员信息表 inner join 学员成绩表 on 学员信息表.学号 = 学员成绩表.学号;

-- 左连接
select 学员信息表.*, 学员成绩表.* 
from 学员信息表 left join 学员成绩表 on 学员信息表.学号 = 学员成绩表.学号;

-- 右连接
select 学员信息表.*, 学员成绩表.* 
from 学员信息表 right join 学员成绩表 on 学员信息表.学号 = 学员成绩表.学号;

-- 纵向合并练习
create table t1(
	key1 varchar(20),
    v1 int(4)
    );
    
load data local infile 'D:/liwork/SQL/data/t1.csv' 
	into table t1
    fields terminated by ','
    ignore 1 lines;
    
create table t2(
	key2 varchar(20),
    v2 int(4)
    );

load data local infile 'D:/liwork/SQL/data/t2.csv' 
	into table t2
    fields terminated by ','
    ignore 1 lines;

-- 用union合并t1与t2表
select t1.* from t1
union
select t2.* from t2;

-- 用union all合并t1与t2表
select t1.* from t1
union all
select t2.* from t2;