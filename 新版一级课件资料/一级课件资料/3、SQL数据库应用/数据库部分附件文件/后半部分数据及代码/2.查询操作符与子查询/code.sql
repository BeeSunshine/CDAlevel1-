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

-- 用and操作符查询s_id为101并且f_id为a1的水果记录
select * from fruits
where s_id = 101 and f_id = 'a1';

-- 用or操作符查询苹果或者橙子的相关记录
select * from fruits
where f_name = 'apple' or f_name = 'orange';

-- 用in操作符查询苹果和橙子的相关记录
select * from fruits
where f_name in('apple','orange');

-- 用not in操作符查询苹果和橙子之外的水果的相关记录
select * from fruits
where f_name not in('apple','orange');

-- 用between...and操作符查询f_price在10元到20元之间的水果记录
select * from fruits
where f_price between 10 and 20;

-- 用like操作符查询所有f_name由a开始的水果记录
select * from fruits
where f_name like 'a%';

-- 用like操作符查询所有f_id由b开始且字符长度为两位的水果记录
select * from fruits
where f_id like 'b_';

-- 用is null操作符查询所有f_name为空的水果记录
select * from fruits
where f_name is null;

-- 查询fruits表中所有不重复的s_id
select distinct s_id from fruits;

-- 用any操作符与子查询语句来查询所有f_id对应的f_price在10元到20元之间的水果记录
select * from fruits where f_id =  any
(select f_id from fruits where f_price between 10 and 20);


-- 用all操作符与子查询语句来查询所有f_price大于20元的水果记录
select * from fruits where f_price > all
(select f_price from fruits where f_price <= 20);

-- 用exists操作符与子查询语句来查询是否存在f_price大于30元的水果记录
select * from fruits where exists
(select * from fruits where f_price > 30);

-- 用as将fruits表名重命名为f后使用
select f.* from fruits as f;

-- 显示f_price金额最大的前三名水果记录
select * from fruits
order by f_price desc
limit 3;