--1：查询每件商品的编号，名称，单品利润，并按照单品利润排序
--某件商品的单品利润=售价-进价，order by后面的表达式也应该是售价-进价，也就是利润
select Wid,Wname,SalesPrice-PurchasePrice as 利润 from Ware 
order by SalesPrice-PurchasePrice desc
--2：统计每件商品的销售量，显示商品名称及销售量，按销售量从高到低排序
--商品名称再Ware表中，销售量表在SalesInfo表中，所以首先需要在这两个表中进行
--链接查询，然后再分组并统计销售量排序
select w.Wname,sum(s.SalesAmount) as 销售量 
from Ware w ,SalesInfo s
where w.Wid=s.Wid group by Wname order by Wname,sum(s.SalesAmount) desc
--3：统计每类商品的销售量，显示商品类别及销售量
--该问题涉及到了Category ，Ware ，SalesInfo三张表，先连接再分组统计
select t.cname,sum(s.SalesAmount) as 销售量
from Category t,Ware w,SalesInfo s
where t.Cid=w.Wid and w.Cid=s.Wid group by cname
--4：按照销售总额对收银员排序
--先统计出每个收银员的销售总额排序。
select e.Ename,sum((SalesPrice-PurchasePrice)*s.SalesAmount) as 销售总额
from Employee e,SalesInfo s,Ware w where e.Eid=s.Eid and w.Wid=s.Wid
group by e.Ename order by 销售总额 desc
--5：统计每件商品的销售量，显示商品名称及销售量，按销售量从高到低排序
--分析：商品名称在Ware表中，销售量在SalesInfo表中，所以首先需在这两个表中进行连接查询，然后再分组统计
select Wname,sum(SalesAmount) as 销售量
from Ware w,SalesInfo s
where w.Wid=s.Wid group by Wname order by sum(SalesAmount) desc
--6：统计每类商品的销售量，显示商品类别及销售量
--分析：该问题涉及到Category、Ware、SalesInfo三个表，先连接再分组统计
select Cname,sum(SalesAmount) as 销售量
from Category c,Ware w,SalesInfo s
where c.Cid=w.Cid and w.Wid=s.Wid group by Cname
--7：统计每种商品到目前的盈利总额
--分析：先连接Ware和SalesInfo表，从中得到商品名称、进价、售价及销售数量，结果中每条记录的销售额应表示为： SalesPrice-PurchasePrice)*SalesAmount
--最后分组统计
select Wname,sum((SalesPrice-PurchasePrice)*SalesAmount) as 盈利总额
from Ware w,SalesInfo s
where w.Wid=s.Wid group by Wname
--8：查询商品销售量排在前五名的商品名称及销量
--先统计出每个收银员的销售总额并按照收银员分组，再按照总额排序。
select top 5 w.Wname,sum(s.SalesAmount) 销量
from Ware w,SalesInfo s where w.Wid=s.Sid
group by w.Wname order by 销量 desc
--9：统计2010年的商品销售量排在前五名的商品名称及销量
--使用聚合函数sum对所有商品的销量进行统计，并按照商品名称分组，
--然后使用top取前五名并排序
select top 5 w.Wname,sum(SalesAmount)as 销量
 from Ware w,SalesInfo s
where  w.Wid=s.Wid and  s.SalesDate between '2010-01-01' and 
'2010-12-31' group by w.Wname order by 销量 desc
--10：统计每个员工在2010年的销量，显示员工名称及销售数量
--和9类似，不过此次显示的是员工名称，数据在员工表中
select e.Ename,sum(SalesAmount)as 销量
from Employee e,SalesInfo s
where e.Eid=s.Eid and s.SalesDate between '2010-01-01' and
'2010-12-31'  group by e.Ename order by 销量 desc
--11：统计2010年的总利润
--用每种商品的销量乘以这件商品的单品利润，即得出这件商品的总利润。
--注意条件是统计2010年的总利润，所以，需要将所有商品的利润求和。
select sum(SalesAmount*(w.SalesPrice-w.PurchasePrice))as 总利润
from SalesInfo s,Ware w
where w.Wid=s.Wid and s.SalesDate  between '2010-01-01' and
'2010-12-31' 

