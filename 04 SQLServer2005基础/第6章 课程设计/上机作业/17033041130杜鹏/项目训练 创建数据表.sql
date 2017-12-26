--�½���Ʒ����Category
create table Category(
--�������
Cid int primary key identity(1,1),
--������ƣ�not null,�����ظ�
Cname nvarchar(20)not null unique,
--�������
Description nvarchar(20)
)


--�½���Ʒ��Ϣ��Ware
create table Ware(
--��Ʒ���
Wid int primary key identity(1,1),
--��Ʒ����
Wname nvarchar(20)not null unique,
--��Ʒ�������
Cid int not null foreign key references Category(Cid),
--��Ʒ����
PurchasePrice decimal(10,2) not null,
--��Ʒ�ۼ�
SalesPrice decimal(10,2) not null,
--��Ʒ���
Amount int not null,
)


--�½�Ա����Employee
create table Employee(
--�������
Eid int primary key identity(1001,1),
--Ա������
Ename nvarchar(20)not null unique,
--Ա������
Epassword varchar(10) check(len(Epassword)>6),--��ע
Remark nvarchar(20),
)


--�½����ۼ�¼��SalesInfo
create table SalesInfo(
--����
Sid int primary key identity(1,1),
--�����۵���Ʒ�ı��
��id int not null foreign key references Ware(Wid),
--��Ʒ���۵�ʱ�� 
SalesDate datetime not null,--��Ʒ���۵�����SalesAmount int not null unique,--����Ա�ı��Eid int not null foreign key references Employee(Eid),)--ɾ�����ݱ�--ɾ����Ʒ����drop table Category--ɾ����Ʒ��Ϣ��drop table Ware--ɾ��Ա����drop table Employee--ɾ����Ʒ���ۼ�¼��drop table SalesInfo