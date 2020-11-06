# created by: Gabriel Sainz Vázquez
# e-mail: gabriel.sainzva@anahuac.mx

# EJERCICIOS SESIÓN 3: JOINS -------------------------------------

# Para estas consultas usa RIGHT JOIN ----
# Obten el código de producto, nombre de producto y descripción de todos 
# los productos.
USE classicmodels;
SELECT productCode, productName, productDescription
	FROM products;

# Obten el número de orden, estado y costo total de cada orden.
SELECT * FROM orders;
SELECT * FROM orderdetails;

SELECT o.orderNumber, o.status, d.priceEach
	FROM orders AS o 
    RIGHT JOIN orderdetails AS d 
    ON o.orderNumber = d.orderNumber;

# Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada 
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

# Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de 
# cada pieza.
SELECT o.orderNumber, p.productName, p.MSRP, d.priceEach
	FROM orders AS o 
    RIGHT JOIN orderdetails AS d 
    ON o.orderNumber = d.orderNumber
    RIGHT JOIN products AS p
    ON p.productCode = d.productCode;

# Para estas consultas usa LEFT JOIN ----
# Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.



# Obtén los clientes que no tienen una orden asociada.


# Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total,
# es decir, los clientes asociados a cada empleado.


# Para estas consultas usa RIGHT JOIN ----

# Repite los ejercicios 5 a 7 usando RIGHT JOIN.

# Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.




