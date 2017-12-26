create database Supermarket on(
name ='marketmdf',
filename='c:\Supermarket .mdf',
size=3MB,
filegrowth=1MB
)
log on(
name ='marketldf',
filename='c:\Supermarket_log .ldf',
size=3MB,
filegrowth=10%
)
--商品类别表
create  table  Category(
Cid int primary key identity(1,1),
Cname nvarchar(20) not null unique,
Description nvarchar(20)
)
--商品信息表
create table Ware(
--商品编号
Wid int primary key identity(1,1),
--商品所属类别（外键）
Cid int not null foreign key references Category(Cid),
--商品名称
Wname nvarchar(20)  not null unique,
--商品进价
jinPrice decimal(10,2) not null,
--商品售价
SalesPrice decimal(10,2) not null,--商品库存量Amount decimal(10,2) not null 
)
--员工信息表
create table Employee(
--员工编号
Eid int primary key identity(1001,1),
--员工姓名
Ename varchar(50) not null,--员工密码Epassword varchar(10) check(len(Epassword)>6),
Remark varchar(20)
)
--销售记录表
create table SalesInfo(
Sid int primary key identity(1,1),
--所销售的商品的编号（外键），必填
Wid int not null foreign key references Ware(Wid),
--员工的编号（外键），必填Eid int not null foreign key references Employee(Eid),
--商品销售时间
SalesDate nvarchar(20) not null,
--商品销售数量
SalesAmount varchar(10) check(len(SalesAmount)>0),
)
