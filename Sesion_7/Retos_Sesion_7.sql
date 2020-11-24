
# CONFIGURACIÓN DE BASES DE DATOS LOCALES ----------

# Crear bases de datos
CREATE DATABASE bedu_test_2;

# Borrar bases de datos

#DROP DATABASE bedu_test_2;

# RECOMENDABLE añadir
CREATE DATABASE IF NOT EXISTS bedu_test_2;
#DROP DATABASE IF EXISTS bedu_test_2;

USE bedu_test_2;

CREATE TABLE users (
	id INT PRIMARY KEY, 
    genero CHAR(1), 
    edad INT, 
    ocupacion INT, 
    cp VARCHAR(20)
);

#DROP TABLE IF EXISTS users; # borrar la tabla 

# RETO 1: Crear nuestras tablas para nuestros otros 2 achivos ----

CREATE TABLE IF NOT EXISTS ratings (
	userid INT,
    id_movie INT,
    rating INT,
    time_stamp BIGINT
    #FOREIGN KEY (userid) REFERENCES users(id), 
    #FOREIGN KEY (id_movie) REFERENCES movies(id)
);

CREATE TABLE IF NOT EXISTS movies (
	movieid INT PRIMARY KEY,
    titulo VARCHAR(40),
    generos VARCHAR(40)
);


SELECT * FROM movies;
SELECT * FROM users;


















