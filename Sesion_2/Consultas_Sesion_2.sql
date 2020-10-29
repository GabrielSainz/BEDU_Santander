# Created by: Gabriel Sainz Vázquez
# e-mail: gabriel.sainzva@anahuac.mx

USE tienda;
SHOW tables;

# Busqueda de patrones con LIKE

SELECT * FROM empleado WHERE nombre LIKE 'M%';
SELECT * FROM empleado WHERE nombre LIKE '%a';
SELECT * FROM empleado WHERE nombre LIKE 'M%a';
SELECT * FROM empleado WHERE nombre LIKE 'M_losa';

# Funciones de agrupamiento 

SELECT (1 + 7) * (10/(6-4));
SELECT * FROM articulo; 
SELECT avg(precio) AS promedio_precio FROM articulo;
SELECT count(*) AS conteo_articulos FROM articulo;
SELECT count(precio) AS conteo_articulos FROM articulo;
SELECT max(precio) AS precio_maximo FROm articulo;
SELECT min(precio) AS precio_minimo FROm articulo;
SELECT sum(precio) AS suma_precios FROm articulo;

# Group BY
SELECT * FROM articulo;
SELECT nombre, sum(precio) AS precio_total 
	FROM articulo GROUP BY nombre;
SELECT nombre, count(*) AS cantidad FROM articulo 
    GROUP BY nombre
    ORDER BY cantidad DESC;
SELECT nombre, min(salario) AS salario_min, max(salario) AS salario_max
	FROM puesto GROUP BY nombre; 
    
    
    
    
    
















