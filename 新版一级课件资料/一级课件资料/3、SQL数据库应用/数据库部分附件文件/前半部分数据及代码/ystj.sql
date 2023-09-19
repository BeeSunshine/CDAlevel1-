-- 使用数据库
use test;

-- 创建带约束条件的emp表
create table emp(
		depid char(3) primary key,
		depname varchar(20) not null,
		peoplecount int unique default 0
);

desc emp;

-- 创建含各种约束条件的数据表
CREATE TABLE example(id INT PRIMARY KEY AUTO_INCREMENT, -- 创建整数型自增主键
			pname VARCHAR(4) NOT NULL, -- 创建非空字符串字段
			math INT DEFAULT 0, -- 创建默认值为0的整数型字段
			minmax FLOAT UNIQUE -- 创建唯一约束小数型字段
 );

desc example;

-- 创建fruits数据表
create table fruits(
	f_id char(10) not null,
	s_id int not null,
	f_name varchar(255) not null,
	f_price decimal(8,2) not null,
	primary key(f_id)
);