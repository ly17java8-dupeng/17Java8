--��ѯ
select*from  Category
select*from  Ware
select*from  Employee
select*from  SalesInfo 
--�����Ʒ���
insert into Category (Cname,Description) values('ʳƷ��','�������ɡ����ס�С�ס�����')
insert into Category (Cname,Description) values('�ջ���Ʒ��','���ࡢ��ˢ������ϴ����')
insert into Category (Cname,Description) values('��װ�ࣺ','���¡����¡�����')
insert into Category (Cname,Description) values('�ҵ��ࣺ','���䡢ϴ�»������ӻ�������')
insert into Category  values('�����ࣺ','����ܡ�ѩ�̡����֡���֭')

--�����Ʒ��Ϣ
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('��������',1,5,8,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',1,6,7,1000)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('С��',1,5,6,600)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',1,4,6,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',2,2,3,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('��ˢ',2,2,3,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',2,3,3.5,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('ϴ����',2,10,15,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',3,500,700,50)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',3,50,60,50)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',3,20,25,100)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',4,5000,6000,50)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('ϴ�»�',4,1200,1500,60)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',4,5200,6000,20)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('����',4,7000,8000,50)

--���Ա����
insert into Employee (Ename,Epassword,Remark) values('������',7777777,'')
insert into Employee (Ename,Epassword,Remark) values('������',8888888,'')
insert into Employee (Ename,Epassword,Remark) values('��ҫΰ',9999999,'')
insert into Employee (Ename,Epassword,Remark) values('������',1111111,'')
insert into Employee (Ename,Epassword,Remark) values('��ҫ��',2222222,'')

--������ۼ�¼��
Update Ware set Amount=Amount-1 where wname ='��������'

 insert into SalesInfo (Wid,SalesDate,SalesAmount,Eid) values(2,'2017-11-12',1,1002)