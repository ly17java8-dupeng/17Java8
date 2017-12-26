--创建商品类别表 （Category）
create table Category(
Cid int primary key identity(1,1),
Cname nvarchar(20) unique not null,
Description nvarchar(25) null 
)
--创建商品信息表 （Ware）
create table Ware(
Wid int primary key,
Wname nvarchar(30) unique not null,
Cid int not null foreign key references Category(Cid),
PurchasePrice decimal(10,2) not null,
SalesPrice decimal(10,2) not null,
Amount decimal(10,2) not null
)

--创建员工表 （Employee）
create table Employee(
Eid int primary key identity(1001,1),
Ename nvarchar(4) not null,
Epassword nvarchar(10) check(len(Epassword)>6),
Remark nvarchar(50)
)

--创建销售记录表 （Salesinfo）
create table Salesinfo(
Sid int primary key identity(1,1),
Wid int foreign key references Ware(Wid) not null,
SalesDate datetime not null,
SalesAmount decimal(10,2) not null,
Eid int not null foreign key references Employee(Eid)
)

--添加数据于 商品类别表（Category）
insert into Category(cname,description) values('食品类','吃的')
insert into Category(cname,description) values('日化类','用的')
insert into Category(cname,description) values('服装类','穿的')
insert into Category(cname,description) values('家电类','玩的')

--添加数据于 商品信息表 （Ware）
insert into Ware values('10001','卫龙辣条',1,'3.8','5','500')
insert into Ware values('10002','非常可乐',1,'0.1','2','500')
insert into Ware values('10003','大宝SOD密',2,'2.3','6','500')
insert into Ware values('10004','瓢柔洗发露',2,'10','18','500')
insert into Ware values('10005','阿迪达斯运动衫',3,'50','388','200')
insert into Ware values('10006','乔丹运动鞋',3,'20','288','200')
insert into Ware values('10007','海尔电冰箱',4,'100','258','100')
insert into Ware values('10008','王牌电视机',4,'1500','3000','100')

--添加数据于 员工表 （Employee）
insert into Employee values('杜鹏','1234567','最丑')
insert into Employee values('樊本领','3456789','最臭')
insert into Employee values('白龙飞','4567898','最糗')

--添加数据于 销售记录表 （Salesinfo）
update Ware set Amount=Amount-1 where Wname='卫龙辣条'
insert into Salesinfo values('10001','2017-12-03','1',1007)

update Ware set Amount=Amount-1 where Wname='飘柔洗发水'
insert into Salesinfo values('10004','2017-12-03','1',1008)

update Ware set Amount=Amount-1 where Wname='海尔电冰箱'
insert into Salesinfo values('10007','2017-12-03','1',1009)



--查询显示每件商品的编号、名称以及利润，按利润从高到低进行排序select wid,Wname,SalesPrice-PurchasePrice As '利润'from Ware order by SalesPrice-PurchasePrice desc
--统计每件商品的销售量，显示商品名称及销售量，按销售量从高到低排序select Wname,sum(SalesAmount)As '销售量'
from Ware W, Salesinfo S 
where w.wid=s.wid group by Wname
--统计每类商品的销售量，显示商品类别及销售量，按销售量从高到低排序select Cname,sum(SalesAmount) as '销售量'from Category c,Ware w,SalesInfo swhere c.Cid=w.Cid and w.Wid=s.Wid group by Cname
--统计每种商品到目前的盈利总额select Wname,sum((SalesPrice-PurchasePrice)*SalesAmount)AS '盈利总额' 
from Ware W,Salesinfo S
where W.wid=S.wid group by Wname



--商品类查询
select*from Category
--商品信息查询
select*from Ware
--员工信息查询
select*from Employee
--销售记录查询
select*from Salesinfo






--按照销售总额对收银员排序
select Ename, sum((salesprice-purchaseprice)*salesamount)as '销售总额'
from employee E,salesinfo S,ware W
where w.wid=s.wid and e.eid=s.eid
group by Ename order by '销售总额' desc
--查询商品销售量排在前五名的商品名称及销量
select top 5 Wname ,sum(s.salesamount)as '销售量'from Ware w,Salesinfo swhere w.wid=s.widgroup by w.wname order by '销售量' desc--统计2010年的商品销售量排在前五名的商品名称及销售量select top 5 w.Wname ,sum(salesamount)as '销售量'from Ware w,Salesinfo swhere w.wid=s.wid and s.SalesDate  between'2015-01-01'and'2019-12-31'group by w.wname order by '销售量' desc--统技每个员工在2010年的销售量，显示员工名称及销售数量select wname ,sum(salesamount)as '销售量'from ware w,salesinfo swhere w.wid=s.wid and s.SalesDate between '2016-01-01'and'2019-12-31'group by w.wname order by '销售量' desc--统计2010年的总利润select sum((w.salesprice-w.purchaseprice)*salesamount)总利润from ware w,Salesinfo swhere w.wid = s.wid and s.SalesDate between'2016-01-01'and'2018-12-31'