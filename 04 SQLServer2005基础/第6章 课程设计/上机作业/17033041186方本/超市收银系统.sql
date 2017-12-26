--新建数据库 supermarket
create database supermarket on (
name= 'supermarket',
filename = 'd:\supermarket.mdf',
size = 3MB,
maxsize = 50MB,
filegrowth = 2MB
)
--新建日志文件
log on(name = 'supermarket_log',
 filename = 'd:\supermarket_log.ldf',
 size = 2MB,
  maxsize = 50MB,
filegrowth = 10%
)


--创建表  新建商品类别表
create table Category(
--自动增长 从一开始 主键
Cid int primary key identity(1,1),
-- 类型名称 不能空切不能重复
Cname nvarchar(10)not null unique,
--类别描述可以为空
Description nvarchar(10)null
)

--创建商品信息类
create table Ware(
--编号 主键
Wid int primary key ,
--商品名称 必填且不能重复
Wname nvarchar(10)not null unique,
--商品所属的类别（外键）必填
Cid int foreign key references Category (cid) null,
--商品进价 ，必须大于零。
PurchasePrice  decimal (10,2) not null,
--商品售价，必须大于零SalesPrice decimal (10,2) not null,--商品库存量，必须大于零
Amount decimal (10,2) not null
)
--创建员工表
create table Employee(
--员工编号，主键 自动增长从1001开始
Eid int primary key identity(1000,1),
--员工姓名 必填
Ename nvarchar(10)not null,
--员工密码 不少于六位
Epassword varchar(10) check(len(Epassword)>6),--备注可以不填Remark nvarchar(10)null,
)
--创建销售记录表
create table Salesinfo (
--主键，自动增长从1开始 
sid int primary key identity(1,1),
--所销售的商品编号（外键），必填
Wid int foreign key references Ware(Wid) not null,
--商品的销售时间，必填
SalesDate datetime not null,
--商品销售的数量，必填且必须大于0
SalesAmount decimal(10,2) not null,
--收银员的编号 （外键），必填
Eid int not null foreign key references Employee(Eid)
)
--添加数据到商品类别表
insert into Category (cname ) values('食品类')insert into Category (cname ) values('日化类')
insert into Category (cname ) values('生活类')
insert into Category (cname ) values('家电类')

--添加数据到 商品信息表
insert into Ware (Wid ,Wname, Cid ,PurchasePrice ,SalesPrice, Amount) values ('61601','都康康方便面',1,'1.5','2','500')
insert into Ware (Wid ,Wname, Cid ,PurchasePrice ,SalesPrice, Amount) values ('61602','小熊饼干',1,'2','3','500')
insert into Ware (Wid ,Wname, Cid ,PurchasePrice ,SalesPrice, Amount) values ('61603','飘柔洗发水',2,'8','10','500')
insert into Ware (Wid ,Wname, Cid ,PurchasePrice ,SalesPrice, Amount) values ('61604','欧莱雅男士洗面乳',2,'10','20','300')
insert into Ware (Wid ,Wname, Cid ,PurchasePrice ,SalesPrice, Amount) values ('61605','阿迪达斯运动鞋',3,'300','500','100')
insert into Ware (Wid ,Wname, Cid ,PurchasePrice ,SalesPrice, Amount) values ('61606','马克华菲夹克',3,'300','1000','100')
insert into Ware (Wid ,Wname, Cid ,PurchasePrice ,SalesPrice, Amount) values ('61607','全自动洗衣机',4,'1500','2500','50')
insert into Ware (Wid ,Wname, Cid ,PurchasePrice ,SalesPrice, Amount) values ('61608','都康康电风扇',4,'150','300','100')
--添加数据到员工表
insert into  Employee (Ename,Epassword)values('都康康','1234567')
insert into  Employee (Ename,Epassword)values('袁延杰','12345678')
insert into  Employee (Ename,Epassword)values('张聪','123456789')
insert into  Employee (Ename,Epassword)values('李毅恒','0123456789')

--销售记录表（SalesInfo）如下：
Update Ware set Amount=Amount-1 where Wname='飘柔洗发水'Insert into SalesInfo(wid,SalesDate,SalesAmount,Eid) values(61603,'2017-11-21','2',1001)
--查询表
select*from Category 
select*from Ware
select*from Employee
select*from Salesinfo
delete from 

--查询每件商品的编号 名称， 单品利润，并按照利润从高到底排列。
select  wid,wname,salesPrice-purchasePrice as 利润 from  ware order by 利润 desc  
--统计每件商品的销售量，显示商品的名称及销售量，并按照销售量从高到低排序
select w.wname,sum(s.salesamount)as 销售量 from
ware w, salesinfo s where w.wid=s.wid group by wname order by 销售量 desc
--统计每类商品的销售量，显示商品类别及销售量
select c.cname,sum(s.salesamount)as 销售量 from
category c,salesinfo s,ware w where c.cid=w.cid and w.wid=s.wid group by c.cname
--统计每种商品到目前为止的总利润
select w.wname,sum((w.salesprice-w.purchaseprice)*s.salesamount) as 总利润 from
ware w,salesinfo s where w.wid=s.wid group by wname
--收银员1002号销售5件61604号商品
update ware set amount=amount-5 where wname='瓢柔洗发露'
insert into salesinfo(Wid,SalesDate,SalesAmount,Eid)values('61604','2017-12-21','2',1002)
--按销售总额对收银员进行排序
select e.ename,sum((w.salesprice-w.purchaseprice)*s.salesamount) as 销售额 from
employee e,salesinfo s,ware w where e.eid=s.eid group by e.ename order by 销售额 desc 

--查询商品销售量排在前五的商品名称及销量
select top 5 w.wname,sum(s.salesamount) as 销售量 from
ware w,salesinfo s where w.wid=s.wid group by w.wname order by 销售量 desc
--统计2017年商品销售量排在前五的商品名称及销量
select top 5 w.wname,sum(s.salesamount) as 销售量 from
ware w,salesinfo s where w.wid=s.wid and S.SalesDate between'2017-12-03' and '2017-12-21'
group by w.wname order by 销售量 desc

--统计每个员工在2017年的销量，显示员工名，销售商品数量
select e.ename,sum(s.salesamount) as 销售量 from
employee e,salesinfo s where e.eid=s.eid
group by e.ename order by 销售量 desc

select sum((w.salesprice-w.purchaseprice)*s.salesamount) as 总利润 from
ware w,salesinfo s where w.wid=s.wid  and S.salesdate between'2017-01-001'and'2017-12-31'

