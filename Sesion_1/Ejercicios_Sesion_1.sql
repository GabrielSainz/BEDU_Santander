# 1. Conectarse al esquema classicmodels
USE classicmodels;
SHOW TABLES;

# 2. Dentro de employees, obtener el apellido de todos los empleados
DESCRIBE employees;
SELECT lastName FROM employees;

# 3. Dentro de employees, obtén el apellido, nombre y puesto de todos los empleados
DESCRIBE employees;
SELECT lastName, firstName, jobTitle
 FROM employees;
 
# 4. Dentro de employees, oben todos los datos de cada empleado
DESCRIBE employees;
SELECT *
 FROM employees;
 
# 5. Dentro de employees, obten apellido, nombre y puesto de todos los empleados que tengan el puesto Sales Rep
DESCRIBE employees;
SELECT lastName, firstName, jobTitle
 FROM employees
 WHERE jobTitle = "Sales Rep";
 
# 6. Dentro de employees, obten apellido, nombre, puesto y codigo de 
# oficina de todos los empleados que tengan el puesto Sales rep
# y codigo de oficina 1
DESCRIBE employees;
SELECT  lastName, firstName, jobTitle, officeCode 
	FROM employees 
    WHERE jobTitle = "Sales Rep" AND
    officeCode = 1;

#7. Dentro de employees, obten apellido,  nombre, puesto y 
# codigo de oficina de todos los empleados que tengan el puesto
# sales rep o codigo de oficina 1
DESCRIBE employees;
SELECT  lastName, firstName, jobTitle, officeCode 
	FROM employees 
    WHERE jobTitle = "Sales Rep" OR
    officeCode = 1;
    
# 8. Dentro de employees, obten el apellido, nombre y codigo
# de oficina de todos los empleados que tenga codigo de ofocina
# 1, 2, o 3
DESCRIBE employees;
SELECT  lastName, firstName, officeCode 
	FROM employees 
    WHERE officeCode IN(1,2,3);
    
#9. Dentro de employees, obten el apellido, nombre y puesto 
# de todos los empleados que tengan un puesto distinto a Sales Rep 
DESCRIBE employees;
SELECT  lastName, firstName, jobTitle 
	FROM employees 
    WHERE jobTitle <> "Sales Rep";
    
# 10. Dentro de employees, obten apellido, nombre y codigo de 
# oficina de todos los empleados cuyo codigo de oficin sea mayor
# a 5
DESCRIBE employees;
SELECT  lastName, firstName, officeCode
	FROM employees 
    WHERE officeCode > 5;
    
# 11. Dentro de employees, obtenga el apellido, nombre y 
# codigo de oficina de todos los empleados cuyo codigo de oficina
# sea menor o igual a 4
DESCRIBE employees;
SELECT  lastName, firstName, officeCode
	FROM employees 
    WHERE officeCode <= 4;

# 12. Dentro de la tabla customers, obten el nombre, pais
# y el estado de todos los clientes cuyo pais sea USA y cuyo 
# estado sea CA
DESCRIBE customers;
SELECT customerName, country, state
	FROM customers
	WHERE country = "USA" AND 
	state = "CA";

# 13. Dentro de la tabla customers, obtener el nombre, país
# estado y limite de credito de todos los clientes cuyo pais
# sea, USA, cuyo estado sea CA y cuyo limite de credito sea >100000
DESCRIBE customers;
SELECT customerName, country, state, creditLimit
	FROM customers
	WHERE country = "USA" AND 
	state = "CA" AND
    creditLimit > 100000;
    
#14. Dento de customers, obten el nombre y pais de todos los 
# clinetes cuto pais sea USA o France
DESCRIBE customers;
SELECT customerName, country
	FROM customers
	WHERE country = "USA" OR 
	country = "France";
    
# 15. Dentro de customoers, obten el nombre, pais y limite de credito
# de todos los clientes cuyo pais sea USA o France y cuyo limite de 
# credito sea mayor a 100000. 
DESCRIBE customers;
SELECT customerName, country, creditLimit
	FROM customers
	WHERE (country = "USA" OR country = "France") AND
    creditLimit > 100000;
    
# 16. Dentro de offices, obten el codigo de oficina, ciudad, 
# telefono y país de aquellas oficinas que se encuentren en USA o
# France
DESCRIBE offices;
SELECT officeCode, city, phone, country
	FROM offices
    WHERE country IN ("USA", "France");
    
#17. Dentro de offices, obten el codigo de oficina, ciudad
# telefono y país de aquellas oficinas que no se encuentren en USA 
# o Fance
DESCRIBE offices;
SELECT officeCode, city, phone, country
	FROM offices
    WHERE country NOT IN ("USA", "France");

# 18. Dentro de orders, obten el número de orden, número de 
# cliente, estado y fecha de envio de todas las ordenes con 
# el número 10165, 10287, 10310
DESCRIBE orders;
SELECT orderNumber, customerNumber, status, orderDate
	FROM orders
    WHERE orderNumber IN (10165, 10287, 10310);
    
#19. Dentro de la tabla customers, obten el apellido y nombre
# de cada cleinte y ordena los resultados por apellido de forma 
# ascencete
DESCRIBE customers;
SELECT contactLastName, customerName
	FROM customers
    ORDER BY contactLastName;

#20. Dentro de la tabla customers, obten el apellido y nombre
# de cada cleinte y ordena los resultados por apellido de forma 
# descencete
DESCRIBE customers;
SELECT contactLastName, customerName
	FROM customers
    ORDER BY contactLastName DESC;
        
# 21. Dentro de customers, obten apellido y nombre de cada cliente y 
# ordena los resultados de forma descendente por apellido y luego por nombre
# de forma ascendente
DESCRIBE customers;
SELECT contactLastName, customerName
	FROM customers
    ORDER BY contactLastName DESC, customerName ASC;

# 22. Dentro de customers, obten el numero de cliente, 
# nombre de cleinte y el limite de credito de los 5 clientes
# con el limite de credito mas alto
DESCRIBE customers;
SELECT customerNumber, customerName, creditLimit 
	FROM customers
    ORDER BY creditLimit DESC
    LIMIT 5;

# 23. Dentro de customers, obten el numero de cliente, nombre 
# de cliente y el limite de credito de los 5 clientes con el 
# limite de credito más bajo
DESCRIBE customers;
SELECT customerNumber, customerName, creditLimit 
	FROM customers
    ORDER BY creditLimit ASC
    LIMIT 5;




    


  
 
 
 
 
 
 




