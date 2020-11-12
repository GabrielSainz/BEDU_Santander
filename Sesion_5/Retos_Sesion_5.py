# -*- coding: utf-8 -*-
"""
Created on Thu Nov 12 08:41:31 2020

@author: Gabriel Sainz Vazquez
"""
import re
from pymongo import MongoClient
# Requires the PyMongo package.
# https://api.mongodb.com/python/current

# Reto 1: Expresiones regulares -----------------------------------------------

# 1. Propiedades que no permitan fiestas.--
client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    '$or': [
        {
            'house_rules': re.compile(r"No fiestas(?i)")
        }, {
            'house_rules': re.compile(r"No parties(?i)")
        }
    ]
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

# Propiedades que admitan mascotas.--

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'house_rules': re.compile(r"pets allowed(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)
# Propiedades que no permitan fumadores.--
client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    '$or': [
        {
            'house_rules': re.compile(r"No smoke(?i)")
        }, {
            'house_rules': re.compile(r"No smoking(?i)")
        }, {
            'house_rules': re.compile(r"No fumar(?i)")
        }
    ]
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

# Propiedades que no permitan fiestas ni fumadores.--
client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    '$and': [
        {
            'house_rules': re.compile(r"No smoking(?i)")
        }, {
            'house_rules': re.compile(r"No parties(?i)")
        }
    ]
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

# Reto 2: Notación punto y arreglos -------------------------------------------

client = MongoClient('mongodb+srv://GabrielSainz:Sv8594ga@beducluster.yoaum.mongodb.net/test?authSource=admin&replicaSet=atlas-4uge3w-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'number_of_reviews': {
        '$gte': 50
    }, 
    'review_scores.review_scores_rating': {
        '$gte': 80
    }, 
    'amenities': {
        '$in': [
            re.compile(r"Ethernet")
        ]
    }, 
    'address.country': 'Brazil'
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)