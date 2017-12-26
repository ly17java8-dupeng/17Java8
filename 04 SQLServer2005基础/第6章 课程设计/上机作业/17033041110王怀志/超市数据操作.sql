-- 查看商品类别表(Category)表
select*from Category
-- 查看商品信息（Ware）表
select*from Ware
-- 查看员工表（Employee）表
select*from Employee
-- 查看销售记录表（ SalesInfo）表
select*from  SalesInfo
--添加商品数据
--delete Category where 
insert into Category (cname,Description)values('武器类','只有90级装备')
insert into Category (cname,Description)values('防具类','只有90级装备')
insert into Category (cname,Description)values('特殊装备','只有90级装备')
insert into Category (cname,Description)values('称号类','最新最强')
insert into Category (cname,Description)values('首饰类','只有90级装备')
--修改信息
--update Category set Description='饮食类' where Description='饮品类'
--添加商品信息
--武器类
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('死亡冰柱','1','999','1388','50')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('暗影蔽日','1','999','1388','50')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('妖刀村正','1','999','1388','50')
--防具类
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('铁马长戈肩甲','2','99','338','40')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('铁马长戈上衣','2','99','338','40')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('铁马长戈腰带','2','99','338','40')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('铁马长戈护腿','2','99','338','40')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('铁马长戈战靴','2','99','338','40')
--特殊装备'
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('波利斯的黄金杯','3','99','199','15')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('英雄王的象征','3','99','199','15')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('罗塞塔的石碑','3','99','199','15')
--称号类
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('龙之挑战','4','338','2200','20')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('海洋霸主','4','199','2200','20')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('拨开迷雾','4','1000','4200','20')
--首饰类
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('启明星的指引','5','135','200','30')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('氤氲之息','5','135','200','30')
insert into Ware(Wname,cid,PurchasePrice,SalesPrice,Amount)values('清泉流响','5','135','200','30')
--修改信息
--update Ware( set 
--添加员工信息
insert into Employee(Ename,Epassword,Remark)values('冬子','1234567','客服小妹一号')
insert into Employee(Ename,Epassword,Remark)values('小春','1234567','客服小妹二号')
insert into Employee(Ename,Epassword,Remark)values('秋香','1234567','客服小妹三号')
insert into Employee(Ename,Epassword,Remark)values('丁香','1234567','客服小妹四号')
--修改信息
--update Employee set 
--添加销售记录(SalesInfo)
Update Ware set Amount=Amount-1 where Wname='海洋霸主'Insert into SalesInfo values(17,'2017-12-24',1,1001)Update Ware set Amount=Amount-1 where Wname='清泉流响'Insert into SalesInfo values(13,'2017-12-24',1,1001)Update Ware set Amount=Amount-1 where Wname='氤氲之息'Insert into SalesInfo values(16,'2017-12-29',1,1001)Update Ware set Amount=Amount-1 where Wname='铁马长戈腰带'Insert into SalesInfo values(6,'2017-12-20',1,1001)Update Ware set Amount=Amount-1 where Wname='罗塞塔的石碑'Insert into SalesInfo values(11,'2017-10-4',1,1001)Update Ware set Amount=Amount-1 where Wname='妖刀村正'Insert into SalesInfo values(3,'2018-1-14',1,1001)Update Ware set Amount=Amount-1 where Wname='波利斯的黄金杯'Insert into SalesInfo values(9,'2018-2-14',1,1001)