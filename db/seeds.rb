# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create!(:email=>"lfcgomes@gmail.com", :name=>"luis gomes", :username=>"lfcgomes", :password=>"123456", :password_confirmation =>"123456")
t = Track.create!(:name=>"Trilho lindo", :city=>"Porto", :country=>"Portugal", :user_id=>u.id)
Point.create!(latitude:"41.144239", longitude:"-8.634675", track_id:t.id)
Point.create!(latitude:"41.142982", longitude:"-8.631209", track_id:t.id)
Point.create!(latitude:"41.142333", longitude:"-8.626263", track_id:t.id)
Point.create!(latitude:"41.138842", longitude:"-8.621242", track_id:t.id)
Point.create!(latitude:"41.136289", longitude:"-8.621113", track_id:t.id)
Point.create!(latitude:"41.134058", longitude:"-8.62489", track_id:t.id)
Point.create!(latitude:"41.130406", longitude:"-8.625362", track_id:t.id)
Point.create!(latitude:"41.127303", longitude:"-8.623774", track_id:t.id)
Point.create!(latitude:"41.129307", longitude:"-8.615577", track_id:t.id)
Point.create!(latitude:"41.129372", longitude:"-8.606737", track_id:t.id)

u = User.create!(:email=>"lcdias127@gmail.com", :name=>"luis dias", :username=>"luisdias", :password=>"foobar", :password_confirmation =>"foobar")
t = Track.create!(:name=>"Caminho de terra", :city=>"Porto", :country=>"Portugal", :user_id=>u.id)
Point.create!(latitude:"41.144239", longitude:"-8.634675", track_id:t.id)
Point.create!(latitude:"41.142982", longitude:"-8.631209", track_id:t.id)
Point.create!(latitude:"41.142333", longitude:"-8.626263", track_id:t.id)
Point.create!(latitude:"41.127303", longitude:"-8.623774", track_id:t.id)
Point.create!(latitude:"41.129307", longitude:"-8.615577", track_id:t.id)
Point.create!(latitude:"41.129372", longitude:"-8.606737", track_id:t.id)
t = Track.create!(:name=>"Circuito da boavista", :city=>"Porto", :country=>"Portugal", :user_id=>u.id)
Point.create!(latitude:"41.138842", longitude:"-8.621242", track_id:t.id)
Point.create!(latitude:"41.136289", longitude:"-8.621113", track_id:t.id)
Point.create!(latitude:"41.134058", longitude:"-8.62489", track_id:t.id)
Point.create!(latitude:"41.130406", longitude:"-8.625362", track_id:t.id)
