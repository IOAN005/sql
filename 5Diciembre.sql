select*from categories;
--Todas las columnas y las filas de la tabla de productos
select*from products;
--Todals las columnas y las filas de clientes 
select*from customers;
--todas las columnas y las filas de ordenes 
select*from orders;

--Obtener las columnas category_name category_id,category de la tabla de categories
Select category_id,category_name from categories;
--obtener las columnas de id ,nombre,precio de la tabla de productos
select product_id,product_name,unit_price from products;
--obtener las columnas de id ,producto,cantidad de la tabla ordenes
select order_id,product_id,quantity from order_details;

--obtener las columnas de id , nombre , apellido,jefe de la tabla de emplelados
select employee_id,first_name,last_name,reports_to from employees;
--filtros
--No se muestran todas las filas
--unicamnete las que cumplen con las categorias
--operadores de comparacion ->  > <  <> <= >= =
--and/or/not
--between-randos between 1 and 20
--in - define si un valor esta en un conjunto sexo in {'M','H'}
--like ->es como el operador igual para usar con un patron ->p%,%n,%l%

--Obtener lols productos cuyo precio seria mayor a 50
select*from products 
where unit_price>50;


--obtener los productos cuyo precio seria menor a 100

SELECT*FROM PRODUCTS
WHERE unit_price <100;

--OBTENER LOS PRODUCTOS QUE TENGAN LA CATEGORIA 1,6 7
SELECT*FROM PRODUCTS
 WHERE category_id IN (1,6,7);
 
 --Obtener los productos que tengan precios entre 35 y 75
 select*from products
 where unit_price between 35 and 75;
 
 --Obtener los productos que emopiezen por p
 select *from products
 where product_name like 'P%';
