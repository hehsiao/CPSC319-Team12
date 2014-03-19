# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category_type.create(id: '1', type: 'NA')
Category_type.create(id: '2', type: 'Dropdown Single Select')
Category_type.create(id: '3', type: 'Scroll Multi Select')
Category_type.create(id: '4', type: 'Checkbox Multi Select')
Category_type.create(id: '5', type: 'TextField')
Category_type.create(id: '6', type: 'DateMMYYYY')
Category_type.create(id: '7', type: 'DateDDMMYYYY')

Category.create(category_name: 'Idea Type', type_id: '2', parent_id: '0', id: '1')
Category.create(category_name: 'Possible Program Referral', type_id: '3', parent_id: '0', id: '2')
Category.create(category_name: 'Organization\'s Mandate', type_id: '3', parent_id: '0', id: '3')
Category.create(category_name: 'Possible Disciplines', type_id: '4', parent_id: '0', id: '4')
Category.create(category_name: 'Timeframe', type_id: '2', parent_id: '0', id: '5')


Category.create(category_name: 'One-Time Project', type_id: '1', parent_id: '1')
Category.create(category_name: 'Recurring Project', type_id: '1', parent_id: '1')
Category.create(category_name: 'Part of a Multi-Phase Project', type_id: '1', parent_id: '1')
Category.create(category_name: 'On-Going Activity', type_id: '1', parent_id: '1')
Category.create(category_name: 'Course-Based Opportunity ', type_id: '1', parent_id: '2')
Category.create(category_name: 'Trek Program ', type_id: '1', parent_id: '2')
Category.create(category_name: 'Reading Week Project ', type_id: '1', parent_id: '2')
Category.create(category_name: 'Community Projects ', type_id: '1', parent_id: '2')
Category.create(category_name: 'Hackthon ', type_id: '1', parent_id: '2')
Category.create(category_name: 'Other: Please Specify', type_id: '5', parent_id: '2')
Category.create(category_name: 'Aboriginal Engagement ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Arts - Culture - Heritage ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Civic Participation - Politics - Democracy ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Community and Economic Development ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Education - Research ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Health - Human Services ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Inclusion - Diversity ', type_id: '1', parent_id: '3')
Category.create(category_name: 'International ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Social Services ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Recreation - Sport ', type_id: '1', parent_id: '3')
Category.create(category_name: 'Other: Please Specify', type_id: '5', parent_id: '3')
Category.create(category_name: 'Other: Please Specify', type_id: '5', parent_id: '4')
Category.create(category_name: 'See Comment ', type_id: '1', parent_id: '4')
Category.create(category_name: 'General ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Flexible ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Needs to Start By', type_id: '6', parent_id: '5')
Category.create(category_name: 'Needs to End By', type_id: '6', parent_id: '5')