select*from Category
select*from ware
select*from Employee
select*from SalesInfo
--添加数据商品类别表
insert into Category (Cname,Description ) values('食品类','食物')
insert into Category (Cname,Description ) values('日化用品','生活用品')
insert into Category (Cname,Description ) values('服装类','衣服')
insert into Category (Cname,Description ) values('家电类','')
--添加数据商品信息表
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount ) values('高露洁牙膏','1','4.50','5.80','231')
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount ) values('田七牙膏','1','1.80','2.70','120')
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount ) values('黑妹牙膏','1','2.60','4.20','96')
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount ) values('海飞丝洗发水','1','12.70','15.90','56')
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount ) values('飘柔洗发水','1','8.10','12.30','103')
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount ) values('霸王洗发水','1','19.40','26.90','65')
--添加数据员工表
insert into Employee (Ename,Epassword,Remark) values('刘庆松','8888888','董事长')
insert into Employee (Ename,Epassword,Remark) values('丁审','8848561','经理')
insert into Employee (Ename,Epassword,Remark) values('张莉','8848520','长期工')
insert into Employee (Ename,Epassword,Remark) values('李小爽','8848567','长期工')
insert into Employee (Ename,Epassword,Remark) values('王琪','8848569','长期工')
insert into Employee (Ename,Epassword,Remark) values('李鑫阳','8848562','临时工')
insert into Employee (Ename,Epassword,Remark) values('岳少月','8848568','临时工')
insert into Employee (Ename,Epassword,Remark) values('梁桂豪','8848566','临时工')
--添加数据销售记录表
Update Ware set Amount = Amount-1 where Wname = '高露洁牙膏'
Insert into SalesInfo values(2,'2017-12-19',1,1006)