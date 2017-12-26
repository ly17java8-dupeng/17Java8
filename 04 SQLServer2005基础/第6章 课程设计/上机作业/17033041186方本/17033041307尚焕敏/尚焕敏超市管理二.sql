--查询商品类别表，信息表，员工信息表，销售记录表
select *from   Category
select *from  Ware
select *from  Employee
select *from  SalesInfo
--新增商品类别数据（Category 商品类别）
insert into Category (Cname,Description) values ('食品类','')
insert into Category (Cname,Description) values ('日化用品','')
insert into Category (Cname,Description) values ('服装类','')
insert into Category (Cname,Description) values ('家电类','')
--新增商品信息数据（Cid商品类别）
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('1','大米','10','12','200')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('1','棒棒糖','1','2','600')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('1','辣条','1.5','3','500')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('2','纳爱斯牙膏','4','6','100')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('2','清扬洗发水','10','16','200')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('2','强生护手霜','2','3','400')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('3','加绒裤','50','100','200')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('3','面包服棉袄','200','600','150')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('3','高领毛衣','60','120','300')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('4','空调','2000','3000','100')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('4','冰箱','1500','2600','260')
insert into Ware(Cid,Wname,jinPrice,SalesPrice,Amount) values ('4','洗衣机','1000','2000','500')
--新增员工数据
insert into Employee(Ename,Epassword,Remark) values ('张飞','2223331','暂无')
insert into Employee(Ename,Epassword,Remark) values ('李丽','2673837','暂无')
insert into Employee(Ename,Epassword,Remark) values ('张一凡','3427848','暂无')
insert into Employee(Ename,Epassword,Remark) values ('王涛','3247894','暂无')
--新增商品销售数据(Wid是商品编号,Eid是员工编号)
update Ware set Amount=Amount-1 where  Wname='大米'
insert into SalesInfo (Wid,Eid, SalesDate,SalesAmount)  values ('1','1002','2017-10-02','1')
update Ware set Amount=Amount-1 where  Wname='强生护手霜'
insert into SalesInfo (Wid,Eid, SalesDate,SalesAmount)  values ('6','1003','2017-10-02','1')
update Ware set Amount=Amount-1 where  Wname='洗衣机'
insert into SalesInfo (Wid,Eid, SalesDate,SalesAmount)  values ('12','1001','2017-10-02','1')
update Ware set Amount=Amount-1 where  Wname='高领毛衣'
insert into SalesInfo (Wid,Eid, SalesDate,SalesAmount)  values ('9','1003','2017-10-02','6')
update Ware set Amount=Amount-1 where  Wname='冰箱'
insert into SalesInfo (Wid,Eid, SalesDate,SalesAmount)  values ('11','1004','2017-10-02','5')

--查询每件商品编号，名称，单品利润，按照单品利润排序
select Wid ,Wname,SalesPrice-jinPrice as 利润 from Ware order by SalesPrice-jinPrice desc
--查询每件商品销售量，显示商品名称及销售量，按销售量从高到底排序
select W.Wname,sum(S.SalesAmount)as 销售量 from Ware W,SalesInfo S 
where W.Wid = S.wid group by Wname order by  销售量 desc
--查询每类商品销售量，显示商品类别及销售量                             
select C.Cname,sum(S.SalesAmount) as 销售量 from Category  C, Ware W, SalesInfo S 
where C.Cid=W.Cid and W.Wid=S.Wid group by Cname
--查询每种商品到目前的盈利总额
select W.Wname, sum((W.SalesPrice-W.jinPrice)*S.SalesAmount) as 盈利总额 from Ware W,SalesInfo S
 where W.Wid=S.Wid group by Wname
--查询按照销售总额对员工排序
select E.Ename ,sum((W.SalesPrice-W.jinPrice)*S.SalesAmount)as 销售总额
from Employee  E, SalesInfo S, Ware W  where E.Eid=S.Eid and W.Wid=S.Sid 
group by E.Ename  order by  销售总额  desc
--查询商品销售量排在前三名的商品名称及销量
select top 3 W.Wname, sum(S.SalesAmount) 销量 from Ware W, SalesInfo  S  
where  W.Wid=S.Wid  group by W.Wname  order  by 销量  desc
--查询2017年商品销量排在前五商品名称及销量 （以下注意时间格式）
select top 5  W.Wname, sum(S.SalesAmount) 销量 from Ware  W,SalesInfo S 
 where W.Wid=S.wid and  S.SalesDate between  '2017-01-1' and '2017-12-31' group by W.Wname order by 销量 desc 
--查询2017年员工销量显示员工名称及销量
select E.Ename ,sum(S.SalesAmount) 销量 from Employee E,SalesInfo S
 where E.Eid=S.Eid  and S.SalesDate between '2017-01-01'  and  '2017-12-30'  group by E.Ename order by  销量  desc
--查询2017年总利润
select sum((W.SalesPrice-W.jinPrice)*S.SalesAmount) as 总利润
 from Ware  W,SalesInfo S 
 where W.Wid=S.Wid and S.SalesDate  between '2017-01-01' and '2017-12-30' 

