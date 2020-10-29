# Ejercicios Sesión 2

USE classicmodels;
SHOW TABLES;

# 1. Dentro de la tabla employees, obten el número de empleado, apellido 
#   y nombre de todos los empleados cuyo nombre empiece con a.
DESCRIBE employees;
SELECT employeeNumber, lastName, firstName 
	FROM employees
    WHERE firstName LIKE ('a%');

# 2. Dentro de la tabla employees, obten el número de empleado, 
#   apellido y nombre de todos los empleados cuyo nombre termina con on.-
SELECT employeeNumber, lastName, firstName 
	FROM employees
    WHERE lastName LIKE ('%on');

# 3. Dentro de la tabla employees, obten el número de empleado, 
#    apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName 
	FROM employees
    WHERE lastName LIKE ('%on%');

# 4. Dentro de la tabla employees, obten el número de empleado, 
#   apellido y nombre de todos los empleados cuyos nombres tienen tres letras 
#    e inician con T y finalizan con m.
SELECT employeeNumber, lastName, firstName 
	FROM employees
    WHERE firstName LIKE ('T_m');

# 5. Dentro de la tabla employees, obten el número de empleado, apellido y 
#    nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, lastName, firstName 
	FROM employees
    WHERE firstName NOT LIKE ('B%');

# 6. Dentro de la tabla products, obten el código de producto y nombre de los
#    productos cuyo código incluye la cadena _20.
DESCRIBE products;
SELECT productCode, productName 
	FROM products 
    WHERE productCode LIKE ('%\_20%');

#------------------------------------------------------
# 7. Dentro de la tabla orderdetails, obten el total de cada orden.
DESCRIBE orderdetails;
SELECT orderNumber, sum(priceEach) AS total_por_orden
	FROM orderdetails 
    GROUP BY orderNumber;

# 8. Dentro de la tabla orders obten el número de órdenes por año.
DESCRIBE orders;
SELECT YEAR(orderDate), count(*) 
	FROM orders 
	GROUP BY YEAR(orderDate);

# 9. Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
DESCRIBE employees;
DESCRIBE offices;
#SELECT officeCode FROM offices WHERE country = "USA";
SELECT lastName, firstName FROM employees
	WHERE officeCode IN (SELECT officeCode FROM offices WHERE country = "USA");

# 10. Obten el número de cliente, número de cheque y cantidad del cliente que ha 
#    realizado el pago más alto.
DESCRIBE payments;
SELECT customerNumber, checkNumber, amount 
	FROM payments
    ORDER BY amount DESC
    LIMIT 1; 

SELECT customerNumber, checkNumber, amount 
	FROM payments
    WHERE amount = (SELECT max(amount) FROM payments); 
     

#11. Obten el número de cliente, número de cheque y cantidad de aquellos clientes
#    cuyo pago es más alto que el promedio.
SELECT customerNumber, checkNumber, amount 
	FROM payments
    WHERE amount > (SELECT avg(amount) FROM payments); 

#12. Obten el nombre de aquellos clientes que no han hecho ninguna orden.
SHOW tables;
DESCRIBE customers;
DESCRIBE orders;
#SELECT customerNumber FROM orders GROUP BY customerNumber;

SELECT customerName FROM customers
	WHERE customerNumber NOT IN (SELECT customerNumber FROM orders GROUP BY customerNumber);

#13. Obten el máximo, mínimo y promedio del número de productos en las órdenes 
#  de venta.
DESCRIBE orderdetails;
SELECT orderNumber, max(quantityOrdered) AS max_prod_orden, 
	min(quantityOrdered) AS min_prod_orden,
    avg(quantityOrdered) AS promedio_prod_orden
	FROM orderdetails 
    GROUP BY orderNumber;

# 14. Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
DESCRIBE orders;
SELECT count(*)
	FROM orders 
	GROUP BY YEAR(orderDate);
SELECT * FROM orders LIMIT 10;


