# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(:email=>"lfcgomes@gmail.com", :name=>"luis gomes", :username=>"lfcgomes", :password_digest=>"sdasdasd")
u.save
t = Track.create(:name=>"Trilho lindo", :city=>"Porto", :country=>"Portugal", :user_id=>1)
t.save

