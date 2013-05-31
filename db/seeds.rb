# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Task.delete_all
User.delete_all

Task.create(:name => 'test_1', :value => 'Test task #1')
Task.create(:name => 'test_2', :value => 'Test task #2')

User.create(:email => 'admin@admin.com', :password => '123', :password_confirmation => '123')