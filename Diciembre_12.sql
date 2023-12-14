--Agrupar por
--Group by
--Select -from
--where
--group by
--having 
--order by 
select * from public.products
order by category_id


--Contar los productos por catgotria
select category_id ,count (product_id)as num_productos
from public.products
group by category_id
order by category_id
--Obtener el precio promedio por categoria de la tabla de productos

select category_id ,avg (unit_price)as precio_promedio
from public.products
group by category_id
order by category_id

--Obtener cuantas unidades hay en stock ,su maximo y minimo por proveedor
select (supplier_id),
sum (units_in_stock) as stock ,
max (units_in_stock) as maximo,
min(units_in_stock) as minimo 
from public.products
group by supplier_id
order by supplier_id;

--Obtener los productos vendidos por orden de la tabla detalle
select (order_id),sum (quantity) as venta
from public.order_details
group by order_id
order by order_id;

--Obtener el numero de ordenes por por empleado de la tabla de ordenes
select employee_id,count(order_id)as num_ordenes 
from public.orders
group by employee_id
order by employee_id;

--Obtener la cantidad de ordenes por clientes der la tabla de ordenes 
select customer_id,count (order_id) as cantidad
from public.orders
group by customer_id
order by customer_id;
--obtener el total de productos vendidos por producto de la tabla de detalle ordenes 
select product_id,sum (quantity) as venta
from public.order_details
group by product_id
order by product_id;

--Columnas calculadas
-- Incrementar en 10 % el precio  de los productos de la tabla de productos
Select product_id,unit_price ,unit_price*1.1 as nuevo_precio
from public.products;
--Calcular el valor del inventario igual a unidades stock  * precio unitatio
--id producto ,nombre y valor unitario
Select product_id, product_name as inventario , units_in_stock*unit_price as valor 
from public.products;

--En la tablña detalle de ordenes calcular el imoporte de cada prodcuto
--importe igual cantidad por precio
--los datos de la consultas id de la orden id producto ,importe
Select order_id ,
product_id,
unit_price*quantity as importe
from public.order_details;

--Obtener el importe por orden de la tabla de detalle de ordenes

select order_id, 
sum (unit_price*quantity )as total
from public.order_details
group by order_id
order by order_id;

--Obtener una consulta que muestre el valor del inventario por categoria
select category_id as inventario,
sum (unit_price*units_in_stock) as valor 
from public.products 
group by category_id
order by category_id;

--Contar los clientes por pais de la tabla de clientes
select country,
count (customer_id)
from public.customers
group by country
order by country;

--Obtener informacion de mas de una tabla 
Select p category_id,
category_name,
product_id,
product_name
from categories  c ,products p
where c.category_id=p.category_id;


Select p category_id,
category_name,
product_id,
product_name
from categories c 
inner join products p
on c.category_id=p.category_id;


--Obtener el id orden , la fecha de la orden ,empleado y su nombre de la tabla
--ordenes y empleado 
Select  order_id,
order_date,
o.employee_id,
first_name
from public.orders o inner join public.employees e
on e.employee_id=o.employee_id;
 
 --Obtener el producto id ,nombre ,proveedor nombre  de la empresa de las tablas de producto y de proveedores

select p.supplier_id,
product_name,
product_id,
company_name
from public.suppliers s  inner join public.products p
on p.supplier_id = s.supplier_id;

--Obtener las ordenes id,fecla el cliente y su nombre
Select order_id,
order_date,
company_name,
c.customer_id
from public.customers o inner join public.orders c
on o.customer_id=c.customer_id;
