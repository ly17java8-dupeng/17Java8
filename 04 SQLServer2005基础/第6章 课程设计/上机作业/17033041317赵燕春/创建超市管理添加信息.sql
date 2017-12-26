select *from Category
select *from  Ware 
select *from  Employee
select *from  SalesInfo
--5.添加数据
insert into Category values('食品',' 方便面，锅巴，饼干')
insert into Category values('电器','插板，电灯泡')
insert into Category values('日用品','毛巾，盆，牙膏，香香')

insert into Ware values(1,'方便面','4.50','5.80','231')
insert into Ware values(1,'锅巴','1.80','2.70','120')
insert into Ware values(2,'插板','2.60','4.20','96')
insert into Ware values(2,'电灯泡','12.70','15.90','56')
insert into Ware values(3,'飘柔洗发水','8.10','12.30','103')
insert into Ware values(3,'牙膏','19.40','26.90','65')

insert into Employee values('杜鹏',123456,'暂无')
insert into Employee values('杨家乐',456789,'暂无')
insert into Employee values('李明祎',159357,'暂无')

insert into SalesInfo  values(5,'2017-10-10',2,1001)
insert into SalesInfo  values(4,'2017-11-12',2,1002)
insert into SalesInfo  values(3,'2017-12-8',1,1003)

--向销售记录里添加一条记录
insert into SalesInfo values(2,'2017-11-28',1,1001)
