-- 添加数据
insert into Category (cname) values ('食品类')
insert into Category (cname) values ('日化用品')
insert into Category (cname) values ('服装类')
insert into Category (cname) values ('家电类')

insert into Ware (wname,cid,purchaseprice,salesprice,amount) values ('高露洁牙膏',1,4.50,5.80,231)
insert into Ware (wname,cid,purchaseprice,salesprice,amount) values ('田七牙膏',1,1.80,2.70,120)
insert into Ware (wname,cid,purchaseprice,salesprice,amount) values ('黑妹牙膏',1,2.60,4.20,96)
insert into Ware (wname,cid,purchaseprice,salesprice,amount) values ('海飞丝洗发水',1,12.70,15.90,56)
insert into Ware (wname,cid,purchaseprice,salesprice,amount) values ('飘柔洗发水',1,8.10,12.30,103)
insert into Ware (wname,cid,purchaseprice,salesprice,amount) values ('霸王洗发水',1,19.40,26.90,65)

insert into Enployee (ename,epassword) values ('刘备',1234567)
insert into Enployee (ename,epassword) values ('曹操',2345678)
insert into Enployee (ename,epassword) values ('曹丕',3456789)
insert into Enployee (ename,epassword) values ('孙权',4567890)
insert into Enployee (ename,epassword) values ('刘禅',5678901)
insert into Enployee (ename,epassword) values ('孙策',6789012)

insert into SalesInfo (wid,salesdate,salesamount,eid) values (1,2017-11-21,3,1001)
insert into SalesInfo (wid,salesdate,salesamount,eid) values (4,2017-11-26,3,1002)

select*from ware
select*from Enployee
select*from SalesInfo
select*from Category