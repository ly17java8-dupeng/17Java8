create database SuperMarket on(
name='marketmdf',
filename='c:\SuperMarket.mdf',
size=3MB,
filegrowth=2MB
)
log
on(
name='marketldf',
filename='c:\SuperMarket.ldf',
size=2MB,
filegrowth=10%
)