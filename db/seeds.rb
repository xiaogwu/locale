# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all

p1 = Post.create(:body => 'Hey this is a fake, seeded, post from the Richmond', :lat => 37.775, :lng => -122.486)
p2 = Post.create(:body => 'This is another fake, seeded, post from the Richmond', :lat => 37.775, :lng => -122.486)
p3 = Post.create(:body => 'This is fake, seeded, post from Diamond Heights', :lat => 37.737, :lng => -122.443)
