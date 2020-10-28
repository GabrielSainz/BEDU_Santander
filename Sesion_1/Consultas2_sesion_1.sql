USE classicmodels;

#RETO 1
SHOW TABLES;
DESCRIBE empleado;
DESCRIBE articulo;
DESCRIBE puesto;
DESCRIBE venta;

#Reto 2
SELECT nombre FROM empleado WHERE id_puesto = 4;
SELECT * FROM puesto WHERE salario >10000;
SELECT * FROM articulo WHERE precio >1000 AND iva >100;
SELECT * FROM venta 
WHERE (id_articulo = 135 OR id_articulo = 963) AND (id_empleado = 835 or id_empleado = 369);
SELECT * FROM venta 
WHERE id_articulo IN (135,963) AND id_empleado IN (835,369)


SELECT * FROM customers;
SELECT * FROM customers WHERE creditLimit > 10000;
SELECT * FROM customers ORDER BY contactLastName;
SELECT * FROM customers ORDER BY contactLastName DESC;
SELECT * FROM customers ORDER BY creditLimit DESC;
SELECT * FROM customers LIMIT 10;
SELECT * FROM customers ORDER BY creditLimit DESC LIMIT 10;

#Reto 3
SELECT *
FROM tienda
ORDER BY salario DESC
LIMIT 5;


