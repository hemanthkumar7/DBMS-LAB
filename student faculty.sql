show databases;
use db_1bm18cs037 
create table student(
snum int,
sname varchar(30),
major varchar(30),
lvl varchar(30),
age int,
primary key(snum)
);
create table faculty (
fid int,
fname varchar(30),
depid int,
primary key(fid)
);

create table class (
cname varchar(30),
meets_at time,
room varchar(30),
fid int,
primary key(cname,fid),
foreign key(fid) references faculty(fid) on delete cascade
);
create table enrolled (
snum int,
cname varchar(30),
primary key(snum,cname),
foreign key(snum) references student(snum) on delete cascade,
foreign key(cname) references class(cname) on delete cascade
);



