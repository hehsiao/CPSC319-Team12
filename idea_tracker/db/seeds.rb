# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create!([
	{id: 1, email: "admin@ubc.ca", password: "12341234", first_name: "Admin", last_name: "Admin", admin: "1"},
	{id: 2, email: "user@ubc.ca", password: "12341234", first_name: "User", last_name: "User", admin: "0"},
	{id: 3, email: "justin@ubc.ca", password: "12341234", first_name: "Justin", last_name: "Ho", admin: "1"},
])

Partner.delete_all
Partner.create!([
	{id: 1, partner_name: "Comm Partner 1", contact_name: "Jane Smith", email: "jsmith@cp1.com", phone_num: "6048223920"},
	{id: 2, partner_name: "Comm Partner 6", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 3, partner_name: "Comm Partner 12", contact_name: "Groucho Marx", email: "gmarx@it.com", phone_num: "6048182320"},	
	{id: 4, partner_name: "Comm Partner 11", contact_name: "Jane Smith", email: "jsmith@cp1.com", phone_num: "6048223920"},
	{id: 5, partner_name: "Comm Partner 63", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 6, partner_name: "Comm Partner 52", contact_name: "Groucho Marx", email: "gmarx@it.com", phone_num: "6048182320"},
	{id: 7, partner_name: "Comm Partner 13", contact_name: "Jane Smith", email: "jsmith@cp1.com", phone_num: "6048223920"},
	{id: 8, partner_name: "Comm Partner 67", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 9, partner_name: "Comm Partner 142", contact_name: "Groucho Marx", email: "gmarx@it.com", phone_num: "6048182320"},
	{id: 10, partner_name: "Comm Partner 18", contact_name: "Jane Smith", email: "jsmith@cp1.com", phone_num: "6048223920"},
	{id: 11, partner_name: "Comm Partner 64", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 12, partner_name: "Comm Partner 52", contact_name: "Groucho Marx", email: "gmarx@it.com", phone_num: "6048182320"},
	{id: 13, partner_name: "Comm Partner 4", contact_name: "Jane Smith", email: "jsmith@cp1.com", phone_num: "6048223920"},
	{id: 14, partner_name: "Comm Partner 67", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 15, partner_name: "Comm Partner 142", contact_name: "Groucho Marx", email: "gmarx@it.com", phone_num: "6048182320"},
	{id: 16, partner_name: "Comm Partner 4", contact_name: "Jane Smith", email: "jsmith@cp1.com", phone_num: "6048223920"},
	{id: 17, partner_name: "Comm Partner 3", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 18, partner_name: "Comm Partner 12", contact_name: "Groucho Marx", email: "gmarx@it.com", phone_num: "6048182320"},
	{id: 19, partner_name: "Comm Partner 1", contact_name: "Jane Smith", email: "jsmith@cp1.com", phone_num: "6048223920"},
	{id: 20, partner_name: "Comm Partner 6", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 21, partner_name: "Comm Partner 12", contact_name: "Groucho Marx", email: "gmarx@it.com", phone_num: "6048182320"},

])

Idea.delete_all
Idea.create!([
	{id: 1, user_id: 3, provider_partner_id: 1, summary: "Youth in Transition in Psychology", description: "Psychology professor at UBC, Dr ****** ****** has approval for funding to work on a Youth in Transitions research project with Community Partner 1. There is a PhD student overseeing the project and there may be an opportunity for 1-2 grad students to help with data collection / subject identification and interviews, etc.", status: 1 },
	{id: 2, user_id: 2, provider_partner_id: 2, summary: "Fitness Program", description: "Engagement Studios part 2: to carry on the work of a previous group of CHD students who created a plan for a sustainable health and fitness program for individuals with developmental disabilities who are accessing the 4 Day Programs delivered by Community Partner 1; students will develop and implement new group fitness activities to support the long term goal of a sustainable program that can be delivered by staff", status: 2},
	{id: 3, user_id: 1, provider_partner_id: 1, summary: "Social Media", description: "come up with a better plan for their current social media activities – they aren’t reaching their full potential", status: 4}
])


Status.delete_all
Status.create!([
	{id: 1, status:	"New Submission" },
	{id: 2, status:	"New Ideas" },
	{id: 3, status: "Removed"}, 	
	{id: 4, status: "Verified"},
	{id: 5, status: "Active Development"}, 
	{id: 6, status: "Referral Pending"},  
	{id: 7, status: "Confirmed"},
	{id: 8, status: "Archived"}
])
