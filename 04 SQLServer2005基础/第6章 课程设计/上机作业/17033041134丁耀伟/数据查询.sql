--查询

--查询显示每件商品的编号、名称以及利润，按利润从高到低进行排序
select Wid'商品编号',Wname'商品名称',SalesPrice-PurchasePrice'利润'
from Ware
order by SalesPrice-PurchasePrice desc

--统计每件商品的销售量，显示商品名称及销售量，按销售量从高到低排序
select Wname'商品名称',sum(SalesAmount)'销售量'
from Ware a,SalesInfo b
where a.Wid=b.Wid group by Wname order by sum(SalesAmount) desc

--统计每类商品的销售量，显示商品类别及销售量
select Cname'商品类别',sum(SalesAmount)'销售量'
from Category a,Ware b,SalesInfo c
where a.cid=b.cid and b.Wid=c.Wid group by Cname

--统计每种商品到目前的盈利总额
select Wname'商品名称',sum((SalesPrice-PurchasePrice)*SalesAmount)'盈利总额'
from Ware a,SalesInfo b
where a.Wid=b.Wid group by Wname

--按照销售总额对销售员进行排序
select a.Ename'姓名',sum(SalesAmount)'销售量',sum((SalesPrice-PurchasePrice)*SalesAmount)'销售总金额'
from Employee a,Ware b,SalesInfo c
where b.Wid=c.Wid and a.Eid=c.Eid group by a.Ename order by sum(SalesAmount) desc,sum((SalesPrice-PurchasePrice)*SalesAmount) desc

--查询商品销售量排在前五名的商品名称及销售量
select top 5 Wname'商品名称',sum(SalesAmount)'销售量'
from Ware a,SalesInfo b
where a.Wid=b.Wid group by Wname order by sum(SalesAmount) desc

----查询商品2017年销售量排在前五名的商品名称及销售量
select top 5 Wname'商品名称',sum(SalesAmount)'销售量'
from Ware a,SalesInfo b
where a.Wid=b.Wid and b.SalesDate between '2017-01-01'and'2017-12-31' group by Wname order by sum(SalesAmount) desc

--统计2017年中，员工销售的产品的销售金额，按照销售总额对销售员进行排序
select a.Ename'姓名',sum(SalesAmount)'销售量',sum((SalesPrice-PurchasePrice)*SalesAmount)'销售总金额'
from Employee a,Ware b,SalesInfo c
where b.Wid=c.Wid and a.Eid=c.Eid and  c.SalesDate between '2017-01-01'and'2017-12-31' group by a.Ename order by sum(SalesAmount)desc, sum((SalesPrice-PurchasePrice)*SalesAmount) desc

--统计2016年的总利润
select sum((SalesPrice-PurchasePrice)*SalesAmount)'销售总金额'
from Ware a,SalesInfo b
where a.Wid=b.Wid and b.SalesDate between '2016-01-01'and'2016-12-31' order by sum(SalesAmount)desc, sum((SalesPrice-PurchasePrice)*SalesAmount) desc