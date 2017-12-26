--新建数据库
create database SuperMarket on(
name = 'marketmdf',
filename='c:\SuperMarket.mdf',
size = 3MB,
filegrowth=2MB
)
log on(
name='marketldf',
filename='c:\SuperMarket.ldf',
size=2MB,
filegrowth=10%
)

--新建数据表
--商品类别表
create table Category(
cid int primary key identity(1,1),--类别主键
Cname nvarchar(20) not null unique,--类别名称
Description nvarchar(20) null --类别
)
select*from Category
--商品信息表
create table Ware(
wid int primary key identity(1,1),--商品主键
Wname nvarchar(10) not null unique,--商品名称
Cid int not null foreign key references Category(cid),--类别外键
PurchasePrice decimal(10,2) not null,--商品进价
SalesPrice decimal(10,2) not null,--商品售价
Amount int not null--商品库存量
)

select*from Ware
--员工表
create table Employee(
Eid int primary key identity(1001,1),--员工编号
Ename nvarchar(10) not null,--员工姓名
Epassword nvarchar(10)check(len(Epassword)>6),--员工密码
Remark nvarchar(50) null--备注
)
Select*from Employee
--销售记录表
create table saleslnfo(
Sid int primary key identity(1,1),--销售记录主键
Wid int not null foreign key references ware (wid),--商品外键
SalesDate nvarchar(10) not null,--商品销售时间
SalesAmount int not null default 1,--商品销售数量
Eid int not null foreign key references Employee(Eid )
)
Select*from saleslnfo
select*from Category
select*from Ware
Select*from  Employee

drop database Category
drop database Ware
drop database  Employee
drop database saleslnfo

insert into Category (cname)values('食品')
insert into Category (cname)values('电器')
insert into Category (cname)values('日用品')
insert into Category (cname)values('服装')


insert into ware(wname,cid,purchaseprice,salesprice,amount)values('豆干',1,3,5,232)
insert into ware(wname,cid,purchaseprice,salesprice,amount)values('格力空调',2,1200,2400,30)
insert into ware(wname,cid,purchaseprice,salesprice,amount)values('飘柔洗发水',3,1000,1800,70)
insert into ware(wname,cid,purchaseprice,salesprice,amount)values('耐克运动鞋',4,200,500,300)
insert into ware(wname,cid,purchaseprice,salesprice,amount)values('辣条',1,0.3,1,300)
insert into ware(wname,cid,purchaseprice,salesprice,amount)values('海尔冰箱',2,1500,2875,25)
insert into ware(wname,cid,purchaseprice,salesprice,amount)values('云南白药牙膏',3,6.8,15,300)
insert into ware(wname,cid,purchaseprice,salesprice,amount)values('特步跑鞋',4,158,307,300)

insert into Employee(Ename,Epassword)values('tom',11111111)
insert into Employee(Ename,Epassword)values('jake',1234567)
insert into Employee(Ename,Epassword)values('月少',2222222)
insert into Employee(Ename,Epassword)values('张三',3333333)
insert into Employee(Ename,Epassword)values('钉肾',4444444)



--insert into saleslnfo(wid,Salesdate,salesamount,eid)values(2,'2017-11-11',5,1001)
--insert into saleslnfo(wid,Salesdate,salesamount,eid)values(5,'2017-11-11',3,1002)
--insert into saleslnfo(wid,Salesdate,salesamount,eid)values(5,'2017-12-07',5,1004)

update ware set amount=amount-1 where wname='特步跑鞋'
insert into saleslnfo values(8,'2009-10-1',5,1003)


select*from Ware
Select*from saleslnfo

--每件商品利润
select wid,wname,salesprice-purchaseprice as利润 from ware order by salesprice-purchaseprice  desc


--商品销售量
select wname,sum(salesamount)as销售量 from ware w,saleslnfo s
where w.wid=s.wid group by wname order by sum(salesamount)desc





--商品种类销售量
select Cname,sum(SalesAmount) as 销售量 from Category c,Ware w,Saleslnfo s
where c.Cid=w.Cid and w.Wid=s.Wid group by Cname


--每种商品盈利总额
select Wname,sum((SalesPrice-PurchasePrice)*SalesAmount) as 盈利总额
from Ware w,Saleslnfo s where w.Wid=s.Wid group by Wname

