-- 使用数据库
use test;

-- 使用abs函数求所有水果平均值与最大值差值的绝对值
select abs(avg(f_price)-max(f_price)) from fruits;

-- 使用length函数求每个f_name的名字与他们的字符长度
select f_name, length(f_name) from fruits group by f_name;

-- 使用now函数求当前的日期和时间
select now();

-- 使用group_concat函数查询不同s_id下对应的所有f_name信息
SELECT s_id, GROUP_CONCAT(f_name) FROM fruits
GROUP BY s_id;

--  使用concat函数在f_name字段值前添加'fruit_'信息
update fruits set f_name = concat('fruit_',f_name);
select * from fruits;

-- 删除f_id为'b5'的数据记录
delete from fruits where f_id = 'b5';
select * from fruits;