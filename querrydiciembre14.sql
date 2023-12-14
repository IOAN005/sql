--Consultas de mas de una tabla
--Monstrar el id producto ,su nombre ,el importe(cantidad*precio)
--de la tabla de detalle de ordenes y la tabla productos

Select od.product_id,product_name,quantity* od.unit_price as importe
from public.products p
inner join public.order_details od
on p.product_id = od.product_id;

--De la consulta anteriormobtener por producto la suma del importe

Select od.product_id,product_name, sum (quantity* od.unit_price) as importe
from public.products p
inner join public.order_details od
on p.product_id = od.product_id
group by od.product_id,product_name
order by od.product_id;

--Contar las ordenes por cliente y empleado ,obteniendo 
--Nombre completo de empleado y nombre de empressa
Select first_name,company_name, count (order_id)as contador
from public.orders o
inner join public.employees e
on o.employee_id = e.employee_id
inner join public.customers c
on o.customer_id=c.customer_id
group by first_name,company_name
order by first_name;

--Obtener el importe vendido de la tabla de order details
--por categoria(nombre de la categoria ) y proveedor (nombre d ela empresa)
--(productos,detalle de ordenes ,proveedores)

Select company_name ,category_name, sum (quantity * od.unit_price) as importe
from public.order_details od
inner join public.products p
on od.product_id=p.product_id
inner join public.categories c
on c.category_id=p.category_id
inner join public.suppliers s
on p.supplier_id = s.supplier_id
group by category_name,company_name
order by category_name,company_name;

--INNER JOIN LEFTOUTER JOIN RIGHTOUTER JOIN  FULL OUTER JOIN


create table TablaA
(
valor varchar(50));

create table TablaB
(
valor varchar(50));

insert into tablaA
values
('a'),
('b'),
('c'),
('d');

insert into tablaB
values
('a'),
('b'),
('e'),
('f');

select * from TablaA
select * from TAblaB;

select a.valor from tablaA A
inner join tablaB B
on a.valor = b.valor

select a.valor ,b.valor from tablaA A
left outer join tablaB B
on a.valor = b.valor

select a.valor,b.valor from tablaA A
right outer join tablaB B
on a.valor = b.valor

select a.valor, b.valor from tablaA A
full outer join tablaB B
on a.valor = b.valor
--Formas de hacer el INsert
--1 Mencionar las columnas 
--2 No mencionar las columnas
--3 Agregar varias filas al mismo tiempo 

--1
Insert into public.categories
(category_id,category_name,description)
values
(100,'PAPELERIA','ARTICULOS PARA PAPELERIA ');

Select *from public.categories
order by category_id desc;

--2
Insert into public.tablaa
value 
('Z');


--3 Varios registros 
insert into public.tablaa
values 
('X'),
('Y');
select* from public.tablaa


update public.categories
set category_name ='P. ECOLOGICOS'
WHERE category_id = 100;

--CONSULTA PARA OBTENER LOS PRODUCTOS QUE NO TGA LA CATEGORIA 100
select *from public.products
where category_id <>100;

--Borrar la categoria 100 de categorias
Delete from public.categories
where category_id=100;

--Actualizar el precio de los productos 
--para incrementar al 10%
select *from public.products

update public.products
set unit_price=unit_price*1.1;






