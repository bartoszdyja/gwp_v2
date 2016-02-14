# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'test_user@test.com', first_name: 'Adam', last_name: 'Nowak', password: '123456', password_confirmation: '123456')
account = Account.create(name: 'Business', user_id: 1)
