--信息添加  insert into values()

--商品类别表（Category）
insert into Category values('食品类','可以吃的东西')
insert into Category values('日化用品类','生活中的东西')
insert into Category values('服装类','身上穿的衣裳')
insert into Category values('家电类','家里用的电器')
--查询
select * from Category

--商品信息表（Ware）
 insert into Ware values('恰恰瓜子',1,'2.5','3','10')
 insert into Ware values('卫龙辣条',1,'1.5','2','10')
 insert into Ware values('营养快线',1,'3.5','4','10')
 insert into Ware values('云南白药牙膏',2,'15','20','10')
 insert into Ware values('欧莱雅男士专用',2,'50','60','10')
 insert into Ware values('舒肤佳香皂',2,'5','7','10')
 insert into Ware values('乔丹运动鞋',3,'100','150','10')
 insert into Ware values('阿玛尼运动裤',3,'80','99','10')
 insert into Ware values('阿迪达斯运动衫',3,'90','100','10')
 insert into Ware values('长虹电视机',4,'3200','3999','10')
 insert into Ware values('海尔电冰箱',4,'220','299','10')
 insert into Ware values('格力空调',4,'410','499','10')
--查询
select * from Ware

--员工表（Employee）
insert into Employee values('杜鹏','1111111','长得很帅的销售员')
insert into Employee values('李鑫阳','2222222','心肠很好的销售员')
insert into Employee values('白龙飞','3333333','很负责任的销售员')
--查询
select * from Employee

--销售记录表（SalesInfo）
Update Ware set Amount=Amount-1 where Wname='恰恰瓜子'Insert into SalesInfo values(1,'2017-12-19',1,1001)Update Ware set Amount=Amount-1 where Wname='格力空调'Insert into SalesInfo values(12,'2017-12-21',1,1002)Update Ware set Amount=Amount-1 where Wname='海尔电冰箱'Insert into SalesInfo values(11,'2017-12-21',1,1003)Update Ware set Amount=Amount-1 where Wname='海尔电冰箱'Insert into SalesInfo values(11,'2017-12-21',1,1001)Update Ware set Amount=Amount-1 where Wname='长虹电视机'Insert into SalesInfo values(10,'2017-12-21',1,1002)Update Ware set Amount=Amount-1 where Wname='长虹电视机'Insert into SalesInfo values(10,'2017-12-21',1,1001)Update Ware set Amount=Amount-1 where Wname='长虹电视机'Insert into SalesInfo values(10,'2017-12-21',1,1003)Update Ware set Amount=Amount-1 where Wname='乔丹运动鞋'Insert into SalesInfo values(7,'2017-01-11',1,1001)Update Ware set Amount=Amount-1 where Wname='舒肤佳香皂'Insert into SalesInfo values(6,'2017-07-01',1,1003)Update Ware set Amount=Amount-2 where Wname='阿玛尼运动裤'Insert into SalesInfo values(8,'2016-02-01',2,1002)Update Ware set Amount=Amount-1 where Wname='云南白药牙膏'Insert into SalesInfo values(4,'2016-03-08',1,1001)Update Ware set Amount=Amount-2 where Wname='欧莱雅男士专用'Insert into SalesInfo values(5,'2016-11-11',2,1002)Update Ware set Amount=Amount-2 where Wname='欧莱雅男士专用'Insert into SalesInfo values(5,'2016-11-11',2,1003)--查询
select * from SalesInfo




