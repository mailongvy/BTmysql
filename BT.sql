use classicmodels;

select * from customers
where salesRepEmployeeNumber > 1300 or salesRepEmployeeNumber < 1100;

select * from products
where buyPrice > 30 and buyPrice < 70;

select * from offices
where country = "USA" and country != "France";

select sum(creditLimit), country from customers
group by country;

select count(customerName), country from customers
group by country;



