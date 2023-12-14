--Group by
--having
--Obtener por producto las cantidades que se han vendido

Select product_id,sum (quantity) as cantidad
from public.order_details
group by product_id
having sum (quantity)>850
order by product_id;


--Obtener los empleados que han vendido mas de 100 ordenes de la tabla de ordenes
Select employee_id,count (order_id)
from public.orders
group by employee_id
having count (order_id)>100
order by employee_id;

--Obtener el numero de ordenes por pais ,unicamente los pàises usa spain
select ship_country,count ( order_id) as ordenes 
from public.orders
where ship_country in ('USA','Spain')
group by ship_country;

--Cuales son los proveedores que nos surten mas de 1 producto ,monstrar el proveedor 
--monstrar la cantidad de productos ,pero unicamente la categoria 1 de la tabla de productos

select supplier_id,count (product_id)
from public.products
where category_id=1
group by supplier_id
having count (product_id) >1
order by supplier_id;

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES USA, CANADA, SPAIN (ShipCountry)
--MOSTRAR UNICAMENTE LOS EMPLEADOS CUYO CONTADOR DE ORDENES SEA MAYOR A 20

Select employee_id,count (order_id)as ordenes 
from public.orders
where ship_country in ('USA','Canada','Spain')
group by employee_id
having count (order_id)>20
order by employee_id;


--OBTENER EL PRECIO PROMEDIO DE LOS PRODUCTOS POR PROVEEDOR
--UNICAMENTE DE AQUELLOS CUYO PROMEDIO SEA MAYOR A 20

Select supplier_id,avg (unit_price)as precio_promedio
from public.products
group by supplier_id
having avg (unit_price)>20
order by supplier_id;


--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock)
--POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO
--PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16
--ADICIONALMENTE CUYA SUMA POR CATEGORIA SEA MAYOR A 300--

Select category_id,sum (units_in_stock)as unidades_existencia 
from public.products
where supplier_id in ('17','19','16')
group by category_id 
having sum (units_in_stock)>300
order by category_id;

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES (ShipCountry)
--USA, CANADA, SPAIN
--CUYO CONTADOR SEA MAYOR A 25

SELECT employee_id, 
       COUNT(order_id) AS contador
FROM orders
WHERE ship_country IN('USA', 'Canada', 'Spain')
GROUP BY employee_id
HAVING COUNT(order_id) > 25;

--OBTENER LAS VENTAS (Quantity * UnitPrice) AGRUPADAS POR PRODUCTO 
--(Orders details) Y CUYA SUMA DE VENTAS SEA MAYOR A 50.000

SELECT product_id, 
       SUM(quantity * unit_price) AS ventas
FROM order_details
GROUP BY product_id
HAVING SUM(quantity * unit_price) > 50000;




