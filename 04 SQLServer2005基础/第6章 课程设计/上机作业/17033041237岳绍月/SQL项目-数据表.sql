--建立商品类别表（Category）
create table Category(
cid int primary key identity(1,1),--类别主键
cname nvarchar(10) not null unique,--类别名称--unique：定义唯一约束，规定该列的值不能重复。
Description nvarchar(20)null --类别描述
)
--建立商品信息表（Ware）
create table Ware(
wid int primary key identity(1,1),--商品的编号（即条形码）
wname nvarchar(20) not null unique,--商品名称
cid int not null foreign key references category(cid),--商品所属的类别（外键）
PurchasePrice decimal(10,2) not null,--商品进价SalesPrice decimal(10,2) not null,--商品售价
Amount decimal(10,2) not null --商品库存量
)
--建立员工表（Employee）
create table Enployee(
Eid int primary key identity(1001,1),--员工编号
Ename nvarchar(10) not null ,--员工姓名 
Epassword varchar(10) check(len(Epassword)>6),--员工密码，不少于六位Remark nvarchar(50)null,--备注，可不填
)
--建立销售记录表（SalesInfo）
create table SalesInfo(
Sid int primary key identity(1,1),--
wid int not null foreign key references ware(wid), --所销售的商品的编号（外键），必填
SalesDate nvarchar(30) not null,--商品销售的时间
SalesAmount int not null default 1,--商品销售的数量，必填且必须大于0
eid  int not null foreign key references Enployee(eid) --收银员的编号（外键），必填
)
--drop table <表名>删除表
drop table Ware 
drop table Category
drop table Employee
drop table SalesInfo


select*from ware
select*from Enployee
select*from SalesInfo
select*from Category