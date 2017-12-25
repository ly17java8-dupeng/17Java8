--查询商品类别添加情况
select*from Category
--查询商品添加情况
select*from Ware
--查询员工信息添加情况
select*from Employee
--查询销售记录情况select*from SalesInfo
--商品类别添加
insert into Category (cname,Description)values('食品类','可以吃的东西')
insert into Category(cname,Description)values('日用化品','日常用品')
insert into Category(cname,Description)values('服装类','衣服')
insert into Category(cname,Description)values('家电类','')

----商品添加
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('高露洁牙膏',2,'13','20','1000')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('洗衣机',4,'1320','3000','500')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount) values ('辣条',1,'5','10','10000')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount) values ('毛衣',3,'50','280','350')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount) values ('霸王洗发水',2,'20','50','1200')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount) values ('面包',1,'2','3','10000')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount) values ('洗洁精',2,'2','3','10000')

----员工信息添加
insert into Employee(Ename,Epassword,Remark)values('邢聪','1234567','')
insert into Employee(Ename,Epassword,Remark)values('王军凯','1234568','懒')
insert into Employee(Ename,Epassword,Remark)values('李紫嫣','1234569','')
insert into Employee(Ename,Epassword,Remark)values('王常虎','1234560','')

----销售记录
update Ware set Amount=Amount-50 where Wname='高露洁牙膏'
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid)values(2,'2010-08-15','50',1002)
update Ware set Amount=Amount-50 where Wname='洗衣机'
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid)values(2,'2010-03-15','50',1002)
update Ware set Amount=Amount-50 where Wname='辣条'
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid)values(3,'2010-04-15','500',1003)
update Ware set Amount=Amount-50 where Wname='霸王洗发水'
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid)values(4,'2010-08-15','50',1004)update Ware set Amount=Amount-50 where Wname='面包'insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid)values(5,'2010-09-15','500',1004)-- 删除表中的数据delete from Ware where Wname='洗洁精' 