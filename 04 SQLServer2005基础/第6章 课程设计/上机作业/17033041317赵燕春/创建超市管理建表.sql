--1.商品类别表
 create table Category(
--类别主键
     cid int primary key identity(1,1),
--类别名称
      cnam nvarchar(20) not null unique,
--类别描述
      Description nvarchar(50)
)
 

--2.商品信息表
create  table Ware(
--商品主键   
     wid int primary key identity(1,1),
--类别外键
      cid int foreign key references Category(cid),
--商品名称
      wname nvarchar(50) not null unique,
--商品进价
      PurchasePrice decimal(10,2 )not null,
--商品售价
       SalesPrice decimal(10,2 )not null,
--库存量
      Amount int not null 
)
  
--3.员工表（Employee）
create table Employee(
--员工主键
      Eid int primary key identity(1001,1),
--员工姓名
      Ename nvarchar(20) not null,
--员工密码
      Epassword varchar(20) not null,
--备注
      Remark varchar(20)
)


--4.销售记录表（SalesInfo）
create table SalesInfo(
--销售记录主键
      Sid int primary key identity(1,1),
--商品外键
      Wid int foreign key references ware(wid),
--销售时间
      SalesDate nvarchar(30)  not null,
--销售数量
       SalesAmount  int not null  default 1 ,
--收银员编号（外键）
        Eid int foreign key references Employee(eid)
)
