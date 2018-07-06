# Webapp::Item::Crud

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/webapp/item/crud`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Dependencies

* Ruby 2.3.1
* Mysql 5.7

## Route
### root
	GET /
### Get item name
	GET /item/{id}
### Create Item
	POST /item
#### Body
	* name
### Change item name
	POST /item/{id}
#### Body
	* name
### Delete item
	POST /item/{id}/delete
 