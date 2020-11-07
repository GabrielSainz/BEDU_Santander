# created by: Gabriel Sainz Vázquez
# e-mail: gabriel.sainzva@anahuac.mx

# EJERCICIOS SESIÓN 3: JOINS -------------------------------------

# Para estas consultas usa RIGHT JOIN ----
# 1. Obten el código de producto, nombre de producto y descripción de todos 
# los productos.
USE classicmodels;
SELECT productCode, productName, productDescription
	FROM products;

# 2. Obten el número de orden, estado y costo total de cada orden.
SELECT * FROM orders;
SELECT * FROM orderdetails;

SELECT o.orderNumber, o.status, d.priceEach
	FROM orders AS o 
    RIGHT JOIN orderdetails AS d 
    ON o.orderNumber = d.orderNumber;

# 3. Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada 
# y precio de cada pieza que muestre los detalles de cada orden.
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM products;

SELECT o.orderNumber, o.orderDate, d.orderLineNumber, 
		p.productName, d.quantityOrdered, d.priceEach
	FROM orderdetails AS d 
    RIGHT JOIN orders AS o
    ON o.orderNumber = d.orderNumber
    RIGHT JOIN products AS p
    ON p.productCode = d.productCode;

# 4. Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de 
# cada pieza.
SELECT o.orderNumber, p.productName, p.MSRP, d.priceEach
	FROM orders AS o 
    RIGHT JOIN orderdetails AS d 
    ON o.orderNumber = d.orderNumber
    RIGHT JOIN products AS p
    ON p.productCode = d.productCode;

# Para estas consultas usa LEFT JOIN ----
# 5. Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
	FROM orders as o
    LEFT JOIN customers as c
    ON c.customerNumber = o.customerNumber;
# NOTA: todos los clientes en la instrucción anterior tendrán asignada una orden

# 6. Obtén los clientes que no tienen una orden asociada.
SELECT c.customerNumber, c.customerName
	FROM customers as c
    LEFT JOIN orders as o
    ON c.customerNumber = o.customerNumber
    WHERE orderNumber IS NULL;

# 7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total,
# es decir, los clientes asociados a cada empleado.
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM payments;

SELECT CONCAT(e.firstName, " ", e.lastName) AS Nombre_empleado, c.customerName, p.checkNumber, p.amount
	FROM employees AS e
    LEFT JOIN customers AS c
    ON c.salesRepEmployeeNumber = e.employeeNumber
    LEFT JOIN payments AS p 
    ON c.customerNumber = p.customerNumber;
# NOTA: no todos los empleados tienen asociado clientes, por lo tanto, 
# tendrán las casillas correspondientes al cliente como NULL

# Para estas consultas usa RIGHT JOIN ----
# Repite los ejercicios 5 a 7 usando RIGHT JOIN.
# 5. Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
SELECT * FROM customers;
SELECT * FROM orders;
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
	FROM customers as c
    RIGHT JOIN orders as o
    ON c.customerNumber = o.customerNumber;
# NOTA: todos los clientes en la instrucción anterior tendrán asignada una orden.
# Existen clientes que no tienen asignada ninguna orden, por lo que, la instruccion 
# anterior los omite

# 6. Obtén los clientes que no tienen una orden asociada.
SELECT c.customerNumber, c.customerName
	FROM orders as o 
    RIGHT JOIN customers as c
    ON c.customerNumber = o.customerNumber
    WHERE o.orderNumber IS NULL;

# 7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total,
# es decir, los clientes asociados a cada empleado.
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM payments;

SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
	FROM payments as p 
    RIGHT JOIN customers as c
    ON c.customerNumber = p.customerNumber
    RIGHT JOIN employees as e
    ON c.salesRepEmployeeNumber = e.employeeNumber;
# NOTA: no todos los empleados tienen asociado clientes, por lo tanto, 
# tendrán las casillas correspondientes al cliente como NULL

# Note que poemos realizar una misma consulta utilizando RIGHT JOIN o LEFT JOIN 
# basta con intercambiar la posoción en la que unes las filas

# Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.

CREATE VIEW clientes_asoc_empleado AS
	(SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
		FROM payments as p 
		RIGHT JOIN customers as c
		ON c.customerNumber = p.customerNumber
		RIGHT JOIN employees as e
		ON c.salesRepEmployeeNumber = e.employeeNumber);

SELECT * 
	FROM clientes_asoc_empleado
    WHERE amount > 100000;
    
