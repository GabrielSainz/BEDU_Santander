# -*- coding: utf-8 -*-
"""
Created on Mon Nov  9 21:25:35 2020

@author: Gabriel Sainz Vázquez
"""

# Reto 1: Colecciones, Documentos y Proyecciones ------------------------------

#1. Fecha, nombre y texto de cada comentario.----

from pymongo import MongoClient

# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'date': 1, 
    'name': 1, 
    'text': 1, 
    '_id': 0
}

result = client['sample_mflix']['comments'].find(
  filter=filter,
  projection=project
)


#2. Título, elenco y año de cada película.----

# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'title': 1, 
    'cast': 1, 
    'year': 1
}

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project
)


#3. Nombre y contraseña de cada usuario.----

# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'name': 1, 
    'password': 1
}

result = client['sample_mflix']['users'].find(
  filter=filter,
  projection=project
)


# Reto 2: Filtros Básicos  ------------------------------
#¿Qué comentarios ha hecho Greg Powell?

# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'name': 'Greg Powell'
}

result = client['sample_mflix']['comments'].find(
  filter=filter
)

#¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?
# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    '$or': [
        {
            'name': 'Greg Powell'
        }, {
            'name': 'Mercedes Tyler'
        }
    ]
}

result = client['sample_mflix']['comments'].find(
  filter=filter
)

#¿Cuál es el máximo número de comentarios en una película?

# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'title': 1, 
    'num_mflix_comments': 1
}
sort=list({
    'num_mflix_comments': -1
}.items())
limit=1

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project,
  sort=sort,
  limit=limit
)

#¿Cuál es título de las cinco películas más comentadas?
# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'title': 1
}
sort=list({
    'num_mflix_comments': -1
}.items())
limit=5

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project,
  sort=sort,
  limit=limit
)









