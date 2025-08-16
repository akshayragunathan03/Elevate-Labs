use order_details;

create table customer(
id int primary key auto_increment,
name varchar(50));

create table order_(
id int ,
o_name varchar(50));

insert into customer(id,name)
values 
(101,"Ram"),
(102,"Rahul"),
(103,"riti");

select * from customer;

insert into order_(id,o_name)
values 
(102,"Fruit"),
(103,"Ball"),
(104,"Utensils");


select * from order_;

#inner join
select * from customer
inner join order_
on customer.id=order_.id;

#Left join
select * from customer
left join order_
on customer.id=order_.id;

#Right Join 
select * from customer
right join order_
on customer.id=order_.id;

#Full join
select * from customer
left join order_
on customer.id=order_.id
union
select * from customer
right join order_
on customer.id=order_.id;




