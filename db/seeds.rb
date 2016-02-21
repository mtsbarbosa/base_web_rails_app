# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! :email => 'sample_admin@sample.com', :password => 'MyString', :password_confirmation => 'MyString', :role => User::ROLES[:admin]
User.create! :email => 'sample_moderator@sample.com', :password => 'MyString', :password_confirmation => 'MyString', :role => User::ROLES[:moderator]