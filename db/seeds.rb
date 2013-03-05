# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create!(:email=>"lfcgomes@gmail.com", :name=>"luis gomes", :username=>"lfcgomes", 
					  :password=>"123456", :password_confirmation => "123456")
t = Track.create!(:name=>"Trilho lindo", :city=>"Porto", :country=>"Portugal", :user_id=>u.id)
p1 = Point.create!(latitude: "41.142354", longitude: "-8.627658", track_id: t.id)
p2 = Point.create!(latitude: "41.137571", longitude: "-8.613667", track_id: t.id)
