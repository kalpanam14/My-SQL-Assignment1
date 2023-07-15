create table SalesPeople1(
snum int primary key,
sname varchar(50) unique,
city varchar(25),
comm decimal(4, 2)
);

insert into SalesPeople1 values(1001,"Peel","London",0.12);
insert into SalesPeople1 values(1002,"Serres","Sanjose",0.13);
insert into SalesPeople1 values(1004,"Motika","London",0.11);
insert into SalesPeople1 values(1007,"Rifkin","Barcelona",0.15);
insert into SalesPeople1 values(1003,"Axelrod","New york",0.10);

desc SalesPeople1;

create table Customers(
Cnum int primary key,
Cname varchar(50),
City varchar(50) not null,
snum int,
foreign key (snum) references SalesPeople1(snum)
);
insert into Customers values(2001, 'Hoffman', 'London', 1001);
insert into Customers values(2002, 'Giovanni', 'Rome', 1003);
insert into Customers values(2003, 'Liu', 'San Jose', 1002);
insert into Customers values(12004, 'Grass', 'Berlin', 1002);
insert into Customers values(12006, 'Clemens', 'London', 1001);
insert into Customers values(2008, 'Cisneros', 'San Jose', 1007);
insert into Customers values(2007, 'Pereira', 'Rome', 1004);

create table Orders(
Onum int primary key,
Amt decimal(7, 2),
Odate date,
Cnum int,
snum int,
foreign key (Cnum) references Customers(Cnum),
foreign key (snum) references SalesPeople1(snum)
);
select Cnum from Customers;

insert into Orders values(3001, 18.69, '1990-10-03', 2008, 1007);
insert into Orders values(3003, 767.19, '1990-10-03', 2001, 1001);
insert into Orders values (3002, 1900.10, '1990-10-03', 2007, 1004);
insert into Orders values(3005, 5160.45, '1990-10-03', 2003, 1002);
insert into Orders values(3006, 1098.16, '1990-10-03', 2008, 1007);
insert into Orders values (3009, 1713.23, '1990-10-04', 2002, 1003);
insert into Orders values(3007, 75.75, '1990-10-04', 2004, 1002);
insert into Orders values(3008, 4273.00, '1990-10-05', 2006, 1001);
insert into Orders values(3010, 1309.95, '1990-10-06', 2004, 1002);
insert into Orders values(3011, 9891.88, '1990-10-06', 2006, 1001);
select * from Orders;


-- count  the number of salesperson whose names begins with "a"/"A"

select count(*) as countsofsalespeople
from SalesPeople1
where  sname like 'A%';

select sp.snum, sp.sname
from SalesPeople1 sp
inner join Orders o ON sp.snum = o.snum
group by sp.snum, sp.sname
having SUM(o.Amt) > 2000;

show tables;
use class2;

--  Count the number of Salesperson belonging to Newyork.
select count(*) as countsofsalespeople
from SalesPeople1
where  city = 'New York';

-- Display the number of Salespeople belonging to London and belonging to Paris.
select city, count(*) AS countofsalespeople
from SalesPeople1
where city in ('London', 'Paris')
group by city;

select sp.snum, sp.sname, o.Odate, count(*) AS OrderCount
from SalesPeople1 sp
inner join Orders o ON sp.snum = o.snum
group by sp.snum, sp.sname, o.Odate;