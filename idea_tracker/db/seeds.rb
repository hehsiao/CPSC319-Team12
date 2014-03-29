# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Setting.delete_all
Setting.create(id: 1, name: 'Allow Sign Up', data: 'Yes')
Setting.create(id: 2, name: 'Default Owner', data: '3')

User.delete_all
User.create!([
	{id: 1, email: "janeadminseed@ubc.ca", password: "12341234", first_name: "Jane", last_name: "Adminseed", admin: "1"},
	{id: 2, email: "johnappleseed@ubc.ca", password: "12341234", first_name: "Jonny", last_name: "Appleseed", admin: "0"},
	{id: 3, email: "justin@a.a", password: "12341234", first_name: "Justin", last_name: "Ho", admin: "1"},
	{id: 4, email: "bryliov@gmail.com", password: "12341234", first_name: "Ilya", last_name: "Bryliov", admin: "0"},
	{id: 5, email: "me@henrychsiao.com", password: "12341234", first_name: "Henry", last_name: "Hsiao", admin: "0"},
	{id: 6, email: "jimmy.gnahz@gmail.com", password: "12341234", first_name: "Jimmy", last_name: "Zhang", admin: "0"},
	{id: 7, email: "jtsengyc@gmail.com", password: "12341234", first_name: "Jason", last_name: "Tseng", admin: "0"},
	{id: 8, email: "ronldho@gmail.com", password: "12341234", first_name: "Ronald", last_name: "Ho", admin: "0"},
	{id: 9, email: "tanat.ratana@gmail.com", password: "12341234", first_name: "Tanat", last_name: "Ratanakosum", admin: "0"},
])

Partner.delete_all
Partner.create!([
	{id: 1, partner_name: "UBC CPSC", contact_name: "Kurt Eiselt", email: "kurt@ubc.ca", phone_num: "6048223920"},
	{id: 2, partner_name: "Systemsvista", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 3, partner_name: "MediaSource", contact_name: "Groucho Marx", email: "gmarx@it.com", phone_num: "6048182320"},
	{id: 4, partner_name: "Pitch'n", contact_name: "Jason Tseng", email: "jtseng@pitchn.com", phone_num: "6048223920"},
	{id: 5, partner_name: "Aircom", contact_name: "Marshall Ericson", email: "mericson@cp6.com", phone_num: "6048321320"},	
	{id: 6, partner_name: "DevAll", contact_name: "Greg Apodaca", email: "gregapodaca1@devall.com", phone_num: "65755585260"},	
	{id: 7, partner_name: "TimeSystems", contact_name: "Jane Smith", email: "jsmith@cp1.com", phone_num: "6048223920"},
	{id: 8, partner_name: "VentureWork", contact_name: "Marijo Aquino", email: "marijoaquino@venturework.com", phone_num: "6048321320"},	
	{id: 9, partner_name: "InfoFiber", contact_name: "John Baily", email: "johnbaily@InfoFiber.com", phone_num: "6048182320"},
	{id: 10, partner_name: "IntelliVirtual", contact_name: "Kamaldeep Bal", email: "kamaldeepbal@IntelliVirtual.com", phone_num: "6048223920"},
	{id: 11, partner_name: "Barberi Productions", contact_name: "Jessica Barbieri", email: "jbarbieri@me.com", phone_num: "6048321320"},	
	{id: 12, partner_name: "UBC CBEL", contact_name: "Justin Ho", email: "justin.ho@ubc.ca", phone_num: "6048182320"},
	{id: 13, partner_name: "LinkAmerican", contact_name: "Christian Bauer", email: "christianb@LinkAmerican.com", phone_num: "6048223920"},
	{id: 14, partner_name: "NewPremiere", contact_name: "Eddy Bedock", email: "eddybedock@newprem.com", phone_num: "6048321320"},	
	{id: 15, partner_name: "ACMECenter", contact_name: "Emily Bergendahl", email: "emilybergendahl@acme.com", phone_num: "6048182320"},
	{id: 16, partner_name: "Siliconbridge", contact_name: "Jennifer Bonneau", email: "jbonneau1@sbridge.com", phone_num: "6048223920"},
	{id: 17, partner_name: "ExcelIcon", contact_name: "Biki Berry", email: "bikib@ExcelIcon.com", phone_num: "6048321320"},	
	{id: 18, partner_name: "Dynozon", contact_name: "Olivier Bonnet", email: "obonnet2@Dynozon.com", phone_num: "6048182320"},

])

Idea.delete_all
Idea.create!([

	{id: 1, owner_id: 3, user_id: 3, provider_partner_id: 1, created_at: "2014-03-1", summary: "Youth in Transition in Psychology 1", description: "Psychology professor at UBC, Dr ****** ****** has approval for funding to work on a Youth in Transitions research project with Community Partner 1. There is a PhD student overseeing the project and there may be an opportunity for 1-2 grad students to help with data collection / subject identification and interviews, etc.", status_id: 1 },
	{id: 2, owner_id: 2, user_id: 2, provider_partner_id: 2, created_at: "2014-03-3", summary: "Fitness Program 1", description: "Engagement Studios part 2: to carry on the work of a previous group of CHD students who created a plan for a sustainable health and fitness program for individuals with developmental disabilities who are accessing the 4 Day Programs delivered by Community Partner 1; students will develop and implement new group fitness activities to support the long term goal of a sustainable program that can be delivered by staff", status_id: 2},
	{id: 3, owner_id: 1, user_id: 1, provider_partner_id: 1, created_at: "2014-03-3", summary: "Social Enterprise", description: "come up with a better plan for their current social media activities – they aren’t reaching their full potential", status_id: 4},
	{id: 4, owner_id: 4, user_id: 3, provider_partner_id: 1, created_at: "2014-03-4", summary: "Youth in Transition in Psychology 2", description: "Psychology professor at UBC, Dr ****** ****** has approval for funding to work on a Youth in Transitions research project with Community Partner 1. There is a PhD student overseeing the project and there may be an opportunity for 1-2 grad students to help with data collection / subject identification and interviews, etc.", status_id: 1 },
	{id: 5, owner_id: 5, user_id: 2, provider_partner_id: 2, created_at: "2014-03-8", summary: "Fitness Program 2" , description: "Engagement Studios part 2: to carry on the work of a previous group of CHD students who created a plan for a sustainable health and fitness program for individuals with developmental disabilities who are accessing the 4 Day Programs delivered by Community Partner 1; students will develop and implement new group fitness activities to support the long term goal of a sustainable program that can be delivered by staff", status_id: 2},
	{id: 6, owner_id: 3, user_id: 1, provider_partner_id: 1, created_at: "2014-03-10", summary: "Social Media 1", description: "come up with a better plan for their current social media activities – they aren’t reaching their full potential", status_id: 4},
	{id: 7, owner_id: 3, user_id: 3, provider_partner_id: 12, receiver_partner_id: 10,  created_at: "2014-03-12", summary: "CBEL", description: "Idea tracker project for CBEL", status_id: 1 },
	{id: 8, owner_id: 2, user_id: 2, provider_partner_id: 1, created_at: "2014-03-16", summary: "Fitness Program 3", description: "Engagement Studios part 2: to carry on the work of a previous group of CHD students who created a plan for a sustainable health and fitness program for individuals with developmental disabilities who are accessing the 4 Day Programs delivered by Community Partner 1; students will develop and implement new group fitness activities to support the long term goal of a sustainable program that can be delivered by staff", status_id: 2},
	{id: 9, owner_id: 1, user_id: 1, provider_partner_id: 1, created_at: "2014-03-19", summary: "Social Media 2", description: "come up with a better plan for their current social media activities – they aren’t reaching their full potential", status_id: 4},

])

Status.delete_all
Status.create!([
	{id: 1, position: 1, status: "New Submission" },
	{id: 2, position: 2, status: "Removed"}, 	
	{id: 3, position: 3, status: "Verified"},
	{id: 4, position: 4, status: "Active Development"}, 
	{id: 5, position: 5, status: "Referral Pending"},  
	{id: 6, position: 6, status: "Confirmed"},
	{id: 7, position: 7, status: "Archived"}
])

CategoryType.delete_all
CategoryType.create(id: '1', type: 'NA')
CategoryType.create(id: '2', type: 'Dropdown Single Select')
CategoryType.create(id: '3', type: 'Scroll Multi Select')
CategoryType.create(id: '4', type: 'Checkbox Multi Select')
CategoryType.create(id: '5', type: 'TextField')
CategoryType.create(id: '6', type: 'DateMMYYYY')
CategoryType.create(id: '7', type: 'DateDDMMYYYY')

Category.delete_all
Category.create(category_name: 'Idea Type', type_id: '2', parent_id: '0', id: '1', description: 'Give a general sense of the kind of idea this might be - from a one-time project to an on-going activity.')
Category.create(category_name: 'Possible Program Referral', type_id: '3', parent_id: '0', id: '2', description: 'Even at an early stage in an idea\'s developmet, there may be a clear connection to a Centre program or CBEL opportunity that we know of.  If so, please indicate.')
Category.create(category_name: 'Organization\'s Mandate', type_id: '3', parent_id: '0', id: '3', description: 'Select all the categories that describe the mandate of the organization that has proposed this idea.')
Category.create(category_name: 'Idea Focus Areas', type_id: '3', parent_id: '0', id: '4', description: 'Select all the categories that describe the community priority area that the project/placement hopes to address.  This might be the same or different from the organization\'s mandate.')
Category.create(category_name: 'Main Activities', type_id: '3', parent_id: '0', id: '5', description: 'Select the categories that best describe the main activities that would be done in this placement/project.')
Category.create(category_name: 'Delivery Location', type_id: '3', parent_id: '0', id: '6', description: 'Please select the location(s) where the project/placement would take place.')
Category.create(category_name: 'Possible Disciplines', type_id: '4', parent_id: '0', id: '7', description: 'Please select any faculties/departments/disciplines that this idea is best suited for.')
Category.create(category_name: 'Timeframe', type_id: '2', parent_id: '0', id: '8', description: 'Please identify if there are any timeframe parameters with this idea or whether there is flexibility on when it can be implemented.')

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

Category.create(category_name: 'Aboriginal Engagement ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Arts - Culture - Heritage ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Civic Participation - Politics - Democracy ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Community and Economic Development ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Education - Research ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Health - Human Services ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Inclusion - Diversity ', type_id: '1', parent_id: '4')
Category.create(category_name: 'International ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Social Services ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Recreation - Sport ', type_id: '1', parent_id: '4')
Category.create(category_name: 'Other: Please Specify', type_id: '5', parent_id: '4')


Category.create(category_name: 'Consultation ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Curriculum Development ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Data Gathering and Mapping ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Direct service delivery ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Event ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Fund Development ', type_id: '1', parent_id: '5')
Category.create(category_name: 'IT ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Marketing and Communications ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Program Development ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Research - Evaluation and Assessment ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Research - Literature Review ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Research - More formalized data collection ', type_id: '1', parent_id: '5')
Category.create(category_name: 'Other: Please specify ', type_id: '5', parent_id: '5')

Category.create(category_name: 'Other: Please Specify', type_id: '5', parent_id: '6')

Category.create(category_name: 'Other: Please Specify', type_id: '5', parent_id: '7')
Category.create(category_name: 'See Comment ', type_id: '1', parent_id: '7')
Category.create(category_name: 'General ', type_id: '1', parent_id: '7')
Category.create(category_name: 'Flexible ', type_id: '1', parent_id: '8') 
Category.create(category_name: 'Needs to Start By', type_id: '6', parent_id: '8')
Category.create(category_name: 'Needs to End By', type_id: '6', parent_id: '8')


Commontator::Comment.delete_all
Commontator::Comment.create(id:1, creator_type: "User", creator_id: "1", thread_id: "1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In et risus id metus tempor sodales eget et nulla. Mauris sollicitudin odio felis, id pretium odio molestie sit amet. In vitae lectus eget quam vehicula tristique nec vel ipsum.", created_at: "2014-03-25 23:40:37", updated_at: "2014-03-25 23:40:37")
Commontator::Comment.create(id:2, creator_type: "User", creator_id: "2", thread_id: "1", body: "Etiam nec augue vel magna interdum varius. Nunc elementum, erat non facilisis tempor, nisi massa gravida velit, in mollis orci tortor sit amet nisl. Nulla vel orci mi.", created_at: "2014-03-25 23:41:37", updated_at: "2014-03-25 23:41:37")
Commontator::Comment.create(id:3, creator_type: "User", creator_id: "3", thread_id: "1", body: "Vestibulum scelerisque velit a malesuada vehicula. Morbi adipiscing iaculis neque, non cursus odio accumsan at. Integer suscipit tristique semper. Maecenas sed massa at magna elementum molestie.", created_at: "2014-03-25 23:42:37", updated_at: "2014-03-25 23:42:37")
Commontator::Comment.create(id:4, creator_type: "User", creator_id: "4", thread_id: "2", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In et risus id metus tempor sodales eget et nulla. Mauris sollicitudin odio felis, id pretium odio molestie sit amet. In vitae lectus eget quam vehicula tristique nec vel ipsum.", created_at: "2014-03-25 23:43:37", updated_at: "2014-03-25 23:43:37")
Commontator::Comment.create(id:5, creator_type: "User", creator_id: "5", thread_id: "3", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In et risus id metus tempor sodales eget et nulla. Mauris sollicitudin odio felis, id pretium odio molestie sit amet. In vitae lectus eget quam vehicula tristique nec vel ipsum.", created_at: "2014-03-25 23:44:37", updated_at: "2014-03-25 23:44:37")
Commontator::Comment.create(id:6, creator_type: "User", creator_id: "6", thread_id: "4", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In et risus id metus tempor sodales eget et nulla. Mauris sollicitudin odio felis, id pretium odio molestie sit amet. In vitae lectus eget quam vehicula tristique nec vel ipsum.", created_at: "2014-03-25 23:45:37", updated_at: "2014-03-25 23:45:37")
Commontator::Comment.create(id:7, creator_type: "User", creator_id: "7", thread_id: "5", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In et risus id metus tempor sodales eget et nulla. Mauris sollicitudin odio felis, id pretium odio molestie sit amet. In vitae lectus eget quam vehicula tristique nec vel ipsum.", created_at: "2014-03-25 23:46:37", updated_at: "2014-03-25 23:46:37")
Commontator::Comment.create(id:8, creator_type: "User", creator_id: "8", thread_id: "6", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In et risus id metus tempor sodales eget et nulla. Mauris sollicitudin odio felis, id pretium odio molestie sit amet. In vitae lectus eget quam vehicula tristique nec vel ipsum.", created_at: "2014-03-25 23:47:37", updated_at: "2014-03-25 23:47:45")
Commontator::Comment.create(id:9, creator_type: "User", creator_id: "9", thread_id: "7", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In et risus id metus tempor sodales eget et nulla. Mauris sollicitudin odio felis, id pretium odio molestie sit amet. In vitae lectus eget quam vehicula tristique nec vel ipsum.", created_at: "2014-03-25 23:48:37", updated_at: "2014-03-25 23:48:37")
Commontator::Comment.create(id:10, creator_type: "User", creator_id: "7", thread_id: "3", body: "Etiam nec augue vel magna interdum varius. Nunc elementum, erat non facilisis tempor, nisi massa gravida velit, in mollis orci tortor sit amet nisl. Nulla vel orci mi.", created_at: "2014-03-25 23:46:37", updated_at: "2014-03-25 23:46:37")
Commontator::Comment.create(id:11, creator_type: "User", creator_id: "8", thread_id: "3", body: "Pellentesque eget vehicula ligula. Aenean nec venenatis erat. Praesent consequat, lacus sit amet fringilla bibendum, justo neque sagittis elit, fermentum tristique justo magna non ante. Duis eget urna neque. Interdum et malesuada fames ac ante ipsum primis in faucibus.", created_at: "2014-03-25 23:47:37", updated_at: "2014-03-25 23:47:45")
Commontator::Comment.create(id:12, creator_type: "User", creator_id: "9", thread_id: "3", body: "Suspendisse eget enim vel orci faucibus semper. Ut tempus justo dolor, et volutpat magna scelerisque porttitor.", created_at: "2014-03-25 23:48:37", updated_at: "2014-03-25 23:48:37")


