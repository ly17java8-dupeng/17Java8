--�½����ݿ�
create database Supermarket on(
             --�������ݿ����ļ���
              name = 'Supermarket',
             --�������ݿ����ļ�·��
             filename = 'd:\Supermarket.mdf',
             --�����ʼ����
             size = 3MB,
             --�����������
             maxsize = 50MB,
             --������������
             filegrowth = 2MB
)
--�½���־�ļ�
log on(
             --������־�ļ���
             name = 'Supermarket_log',
             --������־�ļ�·��
             filename = 'd:\Supermarket_log.ldf',
             --�����ʼ����
             size = 2MB,
             --�����������
             maxsize = 50MB,
             --������������
             filegrowth = 10%
)
--ɾ�����ݿ�
drop database Supermarket