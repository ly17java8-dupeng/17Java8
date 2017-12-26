--新建数据库
create database Supermarket1 on(
name='supermarket1_dmf',
filename='D:\supermarket1_dmf.mdf',
size=4MB,
maxsize=80MB,
filegrowth=2MB
)
--新建数据库日志文件
log on(
name='supermarket1_log',
filename='C:\supermarket1_log.ldf',
size=2MB,
maxsize=50MB,
filegrowth=10%
)

--删除数据库
  drop database SuperMarket1