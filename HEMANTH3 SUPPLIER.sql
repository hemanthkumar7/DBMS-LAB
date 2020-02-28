show databases ;
use db_1bm18cs037 ;
create table suppliers (
sid int,
sname varchar(30),
city varchar (30),
primary key(sid)
);
create table parts(
pid int,
pname varchar(30),
color varchar(30),
primary key (pid)
);
create table catalog (
sid int,
pid int,
cost int,
primary key (sid,pid),
foreign key(sid) references suppliers(sid) on delete cascade,
foreign key(pid) references parts(pid) on delete cascade
);
insert into suppliers values(10001,"Acme Widget","Bangalore"),(10002,"Johns","Kolkata"),(10003,"Vimal","Mumbai"),
(10004,"Reliance","Delhi");
select * from suppliers;
insert into parts values(20001,"book","Red"),(20002,"Pen","Red"),(20003,"Pencil","Green"),(20004,"Mobile","Green"),
(20005,"Charger","Black");
select * from Parts;
insert into catalog values(10001,20001,10);
insert into catalog values(10001,20002,10);
insert into catalog values(10001,20003,30);
insert into catalog values(10001,20004,10);
insert into catalog values(10001,20005,10);
insert into catalog values(10002,20001,10);
insert into catalog values(10002,20002,20);
insert into catalog values(10003,20003,30);
insert into catalog values(10004,20003,40);
select * from catalog;
select * from suppliers;
select * from Parts;
select distinct(suppliers.sid) from Suppliers,Parts,catalog 
where Suppliers.sid = catalog.sid and parts.pid=catalog.pid and Parts.color in("Red","Green");

select distinct(suppliers.sid) from Suppliers,Parts,catalog 
where Suppliers.sid = catalog.sid and parts.pid=catalog.pid and Parts.color = "Red" or Suppliers.city ="Bangalore";

select s1.sid,s2.sid,p1.pid from Suppliers s1,Suppliers s2, Parts p1, catalog c1,catalog c2
where s1.sid =c1.sid and s2.sid=c2.sid and p1.pid=c1.pid and p1.pid= c2.pid and c1.cost>c2.cost;

