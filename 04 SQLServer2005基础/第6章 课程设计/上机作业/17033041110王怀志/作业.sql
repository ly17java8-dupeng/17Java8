-- 查看商品类别表(Category)表
select*from Category
-- 查看商品信息（Ware）表
select*from Ware
-- 查看员工表（Employee）表
select*from Employee
-- 查看销售记录表（ SalesInfo）表
select*from  SalesInfo
--商品利润
select wid,Wname,SalesPrice-PurchasePrice AS利润 from ware
--按销售量,从高到低排序 
select w.wname,sum(s.SalesAmount ) as 销售量 from ware w,SalesInfo  s
where w.wid=s.wid group by wname order by 销售量 desc
--每类商品销售量,显示类别及销售量
select c.cname,sum(s.SalesAmount) as销售量
from Category c ,Ware w,SalesInfo s
where c.cid=w.cid and w.wid =s.wid group by cname
--目前每种商品的盈利
select w.wname,sum((w.SalesPrice-w.PurchasePrice )*s.SalesAmount )as盈利总额
from ware w,SalesInfo s
where w.wid=s.wid group by wname
--客服二销售1号物品
Update Ware set Amount=Amount-1 where wid=1Insert into SalesInfo values(1,'2017-12-24',1,1002)--按销售总额对收银员排序select e.ename, sum((w.SalesPrice-w.PurchasePrice)*s.SalesAmount ) as  销售总额from employee e,SalesInfo s,ware w where e.Eid=s.Eid and w.wid=s.widgroup by e.ename order by 销售总额 DESC--查询销售量在前五的商品及销量select top 5 w.wname, sum(s.SalesAmount)销量from ware w,Salesinfo s where w.wid=s.widgroup by w.wname order by 销量 desc--统计2017年商品销量排行在前五的商品名称及销量select w.wname,sum(s.salesamount)销量 from ware w,salesinfo swhere w.wid=s.wid and s.salesdate between '2017-1-1'and '2017-12-31'group by w.wname order by 销量 desc--统计每个员工在2017年的销量,显示员工名称及销量select e.ename,sum(s.salesamount)销量 from Employee e ,salesinfo swhere e.eid=s.eid and s.salesdate between '2017-1-1'and '2017-12-31'group by e.ename order by 销量 desc--统计2017年的总利润select sum((w.SalesPrice-w.PurchasePrice )*s.SalesAmount )总利润
from ware w,SalesInfo s
where w.wid=s.wid and s.salesdate  between '2017-1-1'and '2017-12-31'