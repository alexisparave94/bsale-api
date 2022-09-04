# Bsale-api

## About the API
Bsale-api is the back-end solution (API-REST) to create an online store using the database provided by Bsale.

## Base Uri
- `https://bsale-client-api.herokuapp.com`

Note: by default the root path return all products

## Endpoints

Here the list of available endpoints:

- GET /products
- GET /categories/:category_id/products
- GET /categories
- GET /search

## GET list of products

- GET `/products` => Return all products of database
### Answer

```ruby
[
	{
		"id": 5,
		"name": "ENERGETICA MR BIG",
		"url_image": "https://dojiw2m9tvv09.cloudfront.net/11132/product/misterbig3308256.jpg",
		"price": 1490.0,
		"discount": 20,
		"cat_name": "bebida energetica"
	},
	{
		"id": 8,
		"name": "PISCO ALTO DEL CARMEN 35º",
		"url_image": "https://dojiw2m9tvv09.cloudfront.net/11132/product/alto8532.jpg",
		"price": 7990.0,
		"discount": 10,
		"cat_name": "pisco"
	},
    ...
]
```

## GET products by category

- GET `/categories/:category_id/products` => Return all products of a specific category

### Parameters

- category_id: is the category's id 

### Example

- GET `/categories/1/products` => Return all products of the category with id = 1, in the database, this category is: "bebidas energeticas"

### Answer

```ruby
[
	{
		"id": 5,
		"name": "ENERGETICA MR BIG",
		"url_image": "https://dojiw2m9tvv09.cloudfront.net/11132/product/misterbig3308256.jpg",
		"price": 1490.0,
		"discount": 20,
		"cat_name": "bebida energetica"
	},
	{
		"id": 6,
		"name": "ENERGETICA RED BULL",
		"url_image": "https://dojiw2m9tvv09.cloudfront.net/11132/product/redbull8381.jpg",
		"price": 1490.0,
		"discount": 0,
		"cat_name": "bebida energetica"
	},
    ...
]
```

## GET list of categories

- GET `/categories` => Return all categories of database
### Answer

```ruby
[
	{
		"id": 1,
		"name": "bebida energetica"
	},
	{
		"id": 2,
		"name": "pisco"
	},
	{
		"id": 3,
		"name": "ron"
	},
    ...
]
```

## GET search products

- GET `/search` => Return products which name contains the query parameter
### Query Parameter

- query: is the word that is going to be compare with the products name and find out which one contains it

### Example

- GET `/search?query=salado` => Return products which name contains the word "salado"

### Answer

```ruby
[
	{
		"id": 47,
		"name": "Maní salado",
		"url_image": "https://dojiw2m9tvv09.cloudfront.net/11132/product/manisaladomp4415.jpg",
		"price": 600.0,
		"discount": 0,
		"category": 5
	}
]
```


