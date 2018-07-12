# Webapp::Item::Crud

## Dependencies

* Ruby 2.3.1
* Mysql 5.7

## Installation
	$ bundle install
## Route
### root
	GET /
### Get item name
	GET /item/{id}
### Create Item
	POST /item
	Body :
	name
### Change item name
	POST /item/{id}
	Body :
	name
### Delete item
	POST /item/{id}/delete
 