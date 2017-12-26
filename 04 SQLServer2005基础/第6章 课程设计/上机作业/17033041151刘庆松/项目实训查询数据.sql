--查询商品编号 名称 利润并排序
select Wid,Wname,SalesPrice-PurchasePrice as 利润
from Ware order by SalesPrice-purchasePrice desc
--统计每件商品的销售量，显示商品名称及销售量，按销售量从高到低排序
select Wname, sum(SalesAmount)as 销售量 from Ware w, SalesInfo s
Where w.Wid= s.Wid group by Wname order by Sum(SalesAmount)desc
--统计每类商品的销售量，显示商品类别及销售量
select Cname,sum(SalesAmount) as 销售量 from Category c, Ware w, SalesInfos
Where c. cid= w.cid and w. wid = s.wid group by Cname
--统计每种商品到目前的盈利总额
select Wname , sum((SalesPrice-PurchasePrice)*SalesAmount)As 盈利总额 from Ware w, SalesInfo s
Where w. Wid = s.wid group by Wname