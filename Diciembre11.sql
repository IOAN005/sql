--Ejemplos de filtros
--Obtener los productos de Order_details cuyo precio sera mayor de 50
Select*from order_details
where unit_price > 50 ;
--Obtener productos de oreder_details cuya cantidad sea mayor a 75
Select*from order_details
where quantity > 75 ;
--Obtenerlos empleados que contenga una "W" en su apellido
select*from employees
where last_name like '%w%';
--Obtener los productos order_details cuya cantidad se encuentre entre 75 y 150
select product_id from public.order_details
where quantity between 75 and 150;
--Obtener los productos cuyo stock este entre 100 y 200
select*from public.products
where units_in_stock between 100 and 200;

--Obtener los productos cuyo nombre comienze con c y termine con i
Select*from public.products
where product_name like 'C%i';
--Obtener los productos cuyo nombre terminan en n

select*from products
where product_name like '%n';
--Obtener los productos cuyo proveedor sea 1,5,7,2,
select*from public.products
where supplier_id in (1,5,7,2);
--Obtener los productos que su nombre empieze por A;G;R
Select*from public.products
where product_name like 'A%'
or product_name like 'G%'
or product_name like 'R%'
order by product_name;

--Order by<NOmbre>
--Ordenar la tabla de productos por nopmbre
select*from public.products
order by product_name;

--Ordenar la tabla de productor por id descendente
select*from public.products
order by product_id desc;

--Ordenar la tabla de productos por categoria ascendente y proveedor descendente
select*from public.products
order by category_id asc , supplier_id desc;

--Obtener las filas de las tablas de productos
--Las FUNCIONES DE AGRECACION SON  COUNT, SUM ,AVG, MAX ,MIN
--LA UNICA QUE ACCEPTA * ES COUNT 
--EL RESTO EL NOMBRE DE UNA COLUMNA O OPERACION ARITMETICA

select count (*) as num_registros
from public.products;

--Obtener el numero de fila de la tabla de empleados
select count(*) as num_registros
from public.employees;

select count(region) as num_registros
from public.employees;

select* from employees;

--Gestion de nullos
create table datos
(a numeric);

insert into datos 
values 
(8),
(7),
(null),
(5);

select *from datos;

select sum (A) from datos;


create table datos2
(a numeric,b numeric);

insert into datos2 
values 
(8,2),
(7,3),
(null,3 ),
(5,5);

select a+b as suma from datos2 ;

select avg(a) from datos;

--Obtener el precio  promedio ,maximo y minimo de productos
select avg (unit_price) as promedio,max (unit_price) as maximo ,min (unit_price) as minimo 
from public.products;



--Obtener cantidad promedio ,maximo y minimo de order_details
select avg (quantity) as promedio,max (quantity) as maximo ,min(quantity) as minimo 
from public.order_details;

--Obtener las unuidades en stock de los productos
select sum (units_in_stock) as unidades  from public.products;



