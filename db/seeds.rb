# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SandwichIngredient.destroy_all
SandwichIngredient.create([{:category => 'Meat', :ingredient => 'Turkey'},
                          {:category => 'Meat', :ingredient => 'Roast Beef'},
                          {:category => 'Meat', :ingredient => 'Ham'},
                          {:category => 'Meat', :ingredient => 'Chicken'},
                          {:category => 'Meat', :ingredient => 'Burger'},

                          {:category => 'Veggie', :ingredient => 'Tomatoes'},
                          {:category => 'Veggie', :ingredient => 'Lettuce'},
                          {:category => 'Veggie', :ingredient => 'Onion'},
                          {:category => 'Veggie', :ingredient => 'Avocado'},

                          {:category => 'Cheese', :ingredient => 'Provolone'},
                          {:category => 'Cheese', :ingredient => 'Cheddar'},
                          {:category => 'Cheese', :ingredient => 'Pepperjack'},
                          {:category => 'Cheese', :ingredient => 'Swiss'},
                          {:category => 'Cheese', :ingredient => 'American'},

                          {:category => 'Bread', :ingredient => 'White'},
                          {:category => 'Bread', :ingredient => 'Wheat'},
                          {:category => 'Bread', :ingredient => 'Sourdough'},
                          {:category => 'Bread', :ingredient => 'Dutch Crunch'},

                          {:category => 'Condiment', :ingredient => 'Mayo'},
                          {:category => 'Condiment', :ingredient => 'BBQ Sauce'},
                          {:category => 'Condiment', :ingredient => 'Pickles'},
                          {:category => 'Condiment', :ingredient => 'Ketchup'},
                          {:category => 'Condiment', :ingredient => 'Mustard'},
                          {:category => 'Condiment', :ingredient => 'Ranch'}])

