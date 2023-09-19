use test;

-- 如前边章节中已创建emp表，请执行下边第四行删除emp表语句，如前边未创建emp表则无需执行下边第四行语句
drop table emp;

-- 创建带约束条件的emp表
create table emp(
		depid char(3) primary key,
		depname varchar(20) not null default '-',
		peoplecount int unique
);

-- 更改表名
alter table emp rename empdep;

-- 更改字段数据类型
alter table empdep modify depname varchar(30);

-- 查看表结构
desc empdep;

-- 更改字段名称
alter table empdep change depname dep varchar(30);

-- 更改字段名称及字段数据类型
alter table empdep change dep depname varchar(20);

-- 为表添加新字段
alter table empdep add maname varchar(10) not null;

-- 将字段顺序改为第一位
alter table empdep modify maname varchar(10) first;

-- 将字段顺序改为另一个字段之后
alter table empdep modify maname varchar(10) after depid;

-- 删除字段
alter table empdep drop maname;

-- 查看表结构
desc empdep;