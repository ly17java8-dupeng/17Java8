--建立SuperMarket数据库
create database SuperMarket
on(
name='SuperMarket',
filename='D:\SuperMarket.mdf',
size=3MB,
MAXsize=50MB,
FILEgrowth=3MB
)
LOG on(
name='SuperMarket_c',
filename='D:\SuperMarket.ldf',
size=3MB,
MAXsize=50MB,
filegrowth=10%)
--drop database SuperMarket