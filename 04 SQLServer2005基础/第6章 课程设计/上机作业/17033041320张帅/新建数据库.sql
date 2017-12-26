create database SuperMarket on(
  name = 'SuperMarket',
  filename='c:\SuperMarket.mdf',
  size=3MB,
  maxsize=50MB,
  filegrowth=2MB)

log on(
  name='SuperMarket_log',
  filename='c:\SuperMarket_log.ldf',
  size=2MB,
  maxsize=50MB,
  filegrowth=10%
)