create database traveller;
use traveller;
create table passenger(passenger_name varchar(50), category varchar(50), gender varchar(50),
boarding_city varchar(50), destination_city varchar(100), distance int, bus_type varchar(50));
create table price(bus_type varchar(50), distance int, price int);
select *from passenger;
insert into passenger values('Sejal', 'AC', 'F', 'Bengaluru', 
'Chennai', 350, 'Sleeper');
insert into passenger values('Anmol', 'Non-AC', 'M', 'Mumbai', 
'Hyderabad', 700, 'Sitting');
insert into passenger values('Pallavi', 'AC', 'F', 'Panaji', 
'Bengaluru', 600, 'Sleeper');
insert into passenger values('Khusboo', 'AC', 'F', 'Chennai', 
'Mumbai', 1500, 'Sleeper');
insert into passenger values('Udit', 'Non-AC', 'M', 'Trivandrum', 
'Panaji', 1000, 'Sleeper');
insert into passenger values('Ankur', 'AC', 'M', 'Nagpur', 
'Hyderabad', 500, 'Sitting');
insert into passenger values('Hemant', 'Non-AC', 'M', 'Panaji', 
'Mumbai', 700, 'Sleeper');
insert into passenger values('Manish', 'Non-AC', 'M', 'Hyderabad', 
'Bengaluru', 500, 'Sitting');
insert into passenger values('Piyush', 'AC', 'M', 'Pune', 
'Nagpur', 700, 'Sitting');

insert into price values('Sleeper', 350, 770);
insert into price values('Sleeper', 500, 1100);
insert into price values('Sleeper', 600, 1320);
insert into price values('Sleeper', 700, 1540);
insert into price values('Sleeper', 1000, 2200);
insert into price values('Sleeper', 1200, 2640);
insert into price values('Sleeper', 1500, 2700);
insert into price values('Sitting', 500, 620);
insert into price values('Sitting', 600, 744);
insert into price values('Sitting', 700, 868);
insert into price values('Sitting', 1000, 1240);
insert into price values('Sitting', 1200, 1488);
insert into price values('Sitting', 1500, 1860);

select gender, count(gender) from passenger where distance>600 group by gender;

select min(price) from price where bus_type='Sleeper';

select passenger_name from passenger where passenger_name like 'S%';

select ra.passenger_name, ra.boarding_city, ra.destination_city, na.bus_type, na.price
 from passenger ra inner join price na on ra.bus_type=na.bus_type
and ra.distance=na.distance;

select ta.passenger_name, da.price from passenger ta inner join price da 
on ta.bus_type=da.bus_type and ta.distance=da.distance where 
ta.distance=1000 and da.bus_type='Sitting';

select price as 'Sitting Price' from price pd where distance=(select distance from passenger ab where
passenger_name='pallavi') and bus_type='Sitting';

select price as 'Sleeper Price' from price pd where distance=(select distance from passenger ab where 
passenger_name='pallavi') and bus_type='Sleeper';

select distance from passenger group by distance order by distance desc;

select passenger_name,distance*100/sum(distance) over() 'percentage %' from passenger;

select ak.distance,ak.price,
case
when ak.price>=1000 then 'Expensive'
when ak.price>=500 and ak.price<1000 then 'Average Cost'
when ak.price<500 then 'Cheap'
end as category
from price ak group by ak.distance, ak.price;
