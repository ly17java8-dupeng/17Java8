--商品类别名称创建
insert into Category(cname)values('食品类')
insert into Category(cname)values('日化用品')
insert into Category(cname)values('服装类')
insert into Category(cname)values('家电类')
--商品信息创建
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('高露洁牙膏','2','4.50','5.80','231')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('田七牙膏','2','1.80','2.70','120')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('黑妹牙膏','2','2.60','4.20','96')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('海飞丝洗发露','2','12.70','15.90','56')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('飘柔洗发露','2','8.10','11.90','103')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('霸王洗发露','2','19.70','26.90','65')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('香飘飘奶茶','1','1.60','3','105')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('摩卡咖啡','1','3.40','6','76')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('海澜之家羽绒服','3','400','600','76')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('森马卫衣','3','360','500','86')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('花花公子衬衫','3','300','700','96')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('海澜之家裤子','3','120','210','56')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('海尔电冰箱','4','3000','5800','16')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('格力空调','3','2300','4200','20')
 insert into ware(wname ,cid,purchaseprice,salesprice,amount) values('夏普电视','3','2000','2800','30')
--员工表
 insert into employee(ename,epassword,remark) values('张丽','4455664','暂无')
 insert into employee(ename,epassword,remark) values('王大锤','4848355','暂无')
 insert into employee(ename,epassword,remark) values('李新阳','2628469','暂无')
 insert into employee(ename,epassword,remark) values('王琦','3364551','暂无')--销售记录--表明SalesInfo 1主键 增长 2.销售商品编号 外键
--3.商品销售时间 4.商品销售数量 5.收银员编号 外键
Update ware set amount=amount-1 where wname='海澜之家羽绒服'insert into salesInfo(wid,salesdate,salesamount,eid)values('9','2009-10-12','1','1001')Update ware set amount=amount-2 where wname='摩卡咖啡'insert into salesInfo(wid,salesdate,salesamount,eid)values('8','2009-10-13','2','1002')Update ware set amount=amount-1 where wname='海尔电冰箱'insert into salesInfo(wid,salesdate,salesamount,eid)values('13','2009-10-12','1','1001')Update ware set amount=amount-2 where wname='黑妹牙膏'insert into salesInfo(wid,salesdate,salesamount,eid)values('2','2009-10-13','2','1002')Update ware set amount=amount-1 where wname='霸王洗发露'insert into salesInfo(wid,salesdate,salesamount,eid)values('6','2009-10-12','1','1001')Update ware set amount=amount-2 where wname='香飘飘奶茶'insert into salesInfo(wid,salesdate,salesamount,eid)values('7','2009-10-13','2','1002')Update ware set amount=amount-1 where wname='花花公子衬衫'insert into salesInfo(wid,salesdate,salesamount,eid)values('12','2009-10-12','1','1001')Update ware set amount=amount-2 where wname='森马卫衣'insert into salesInfo(wid,salesdate,salesamount,eid)values('10','2009-10-13','2','1002')
select*from salesInfo--计算利润 编号 名称 （售价—进价）order by （售价-进价）as与from之间是利润名字select wid,wname,salesprice-purchaseprice as 利润 from wareorder by salesprice-purchaseprice desc--查询每个商品销售量select w.wname,sum(s.salesamount) as 销售量 from ware w,salesInfo swhere w.wid=s.wid group by wname order by  sum(s.salesamount) desc--统计每类商品销售量select cname,sum(salesamount) as 销售量 from category c,ware w,salesInfo swhere c.cid=w.cid and w.wid=s.wid group by cname--查询每种商品到目前盈利总数
select wname,sum((salesprice-purchaseprice)*salesamount) as 盈利总额from ware w,salesInfo swhere w.wid=s.wid group by wname--销售什么什么类的东西 cid是类
update ware set amount=amount-5 where cid=1
insert into salesInfo(wid,salesdate,salesamount,eid)values('1','2010-11-12','5','1002')
--销售总额排序同时对收银员销售排序
select e.ename,sum((w.salesprice-purchaseprice)*s.salesamount)as 销售总额
from employee e,salesInfo s,ware w where e.eid=s.eid and w.wid =w.wid
group by e.ename order by 销售总额 desc
--查询商品销售前五名
select top 5 w.wname,sum(s.salesamount)as 销量from ware w,salesInfo s where w.wid=s.wid group by w.wname order by 销量 desc--统计2010年商品销售前5select top 5 w.wname,sum(s.salesamount)as 销量from ware w,salesInfo s where w.wid=s.wid and s.salesdate between '2009-01-01'and'2010-12-30'group by w.wname order by 销量 desc--统计每个员工2009年销量 要求(显示员工名称和销售量)select e.ename,sum(s.salesamount)as 销量
from employee e,salesInfo s
 where e.eid=s.eid and s.salesdate between '2009-01-01'and'2010-12-30'
group by e.ename order by 销量 desc
--2009总利润
select sum((w.salesprice-w.purchaseprice)*s.salesamount)as 总利润
from ware w,salesInfo s 
where w.wid=s.wid  and s.salesdate between'2009-01-01' and '2010-12-31' 
--查询 1-商品类别 2-商品信息 3-员工表信息 4-销售记录
select *from Category
select *from ware
select *from employee
select sid ,wid as 商品编号,salesdate as 销售时间,salesamount as 销售数量,eid as 员工编号 from salesInfo
