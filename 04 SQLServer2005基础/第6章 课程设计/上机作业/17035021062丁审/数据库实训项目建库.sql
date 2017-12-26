--新建数据库SuperMarket
create database SuperMarket on (
--定义新建文件名
name = 'SuperMarket',
--定义新建文件路径
filename = 'C:\SuperMarket.mdf',
--定义初始容量
size = 3MB,
--定义最大容量
maxsize = 50MB,
--定义增长容量
filegrowth = 2MB 
)
--新建日志文件
log on (
--定义日志文件名
name = 'SuperMarket_log',
--定义日志文件路径
filename = 'C:\SuperMarket_log.ldf',
--定义初始容量
size = 1MB,
--定义最大容量
maxsize = 50MB,
--定义增长容量
filegrowth = 10% 
)
drop database SuperMarket