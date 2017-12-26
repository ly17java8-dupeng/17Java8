--建立商品类别表(Category)表
create table Category(
cid int primary key identity(1,1),
cname nvarchar(10)  not null unique,
Description nvarchar(10) null)
--drop table Category
--建立商品信息（Ware）表
create table Ware(
wid int primary key identity(1,1),
Wname nvarchar(10)  not null unique,cid int not null foreign key references Category(cid),PurchasePrice decimal(10,2)not null check(len(PurchasePrice)>1),SalesPrice decimal(10,2)not null check(len(SalesPrice)>1),Amount int check(len(Amount)>1))--drop table Ware--建立员工表（Employee）表create table Employee(Eid int primary key identity(1001,1), Ename nvarchar(5)not null,Epassword varchar(10)check(len(Epassword)>6),Remark nvarchar (20)null)--drop table Employee--建立销售记录表（ SalesInfo）表create table SalesInfo(Sid int primary key identity(1,1),wid int not null foreign key references Ware(wid ),SalesDate datetime not null,SalesAmount int check(len(SalesAmount)>0),Eid int not null foreign key references Employee(Eid))--drop table SalesInfo