FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@factory.com" }
    password "foobar"
    password_confirmation "foobar"
  end
end

# FactoryGirl.define do
# 	Factory.define :user do |f|
# 	  f.sequence(:email) { |n| "foo#{n}@example.com" }
# 	  f.password "secret"
# 	end
# end


# FactoryGirl.define do  
#     factory :user do
#         sequence(:name) { |n| "User Name #{n}" }                         
#         sequence(:email) { |n| "person-#{n}@example.com" } 
#         password "foobar"
#         password_confirmation "foobar"
#     end

#     factory :micropost do
#         content "Foo bar"
#         user
#     end
# end