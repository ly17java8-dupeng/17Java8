create database superMarket
on (
    name ='superMarketmdf',
    filename ='d:\superMarket.mdf',
    size =3MB,
    maxsize =50MB,
    filegrowth =2MB
)
log on (
    name ='superMarketldf',
    filename ='d:\superMarket-log.ldf',
    size =3MB,
    maxsize =50MB,
    filegrowth =10%
)
