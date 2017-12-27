# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# categories = ["Guitar", "Bass", "Piano", "Voice", "Drums"]

# categories.each do |category_name|
# 	Instrument.create(name: category_name)
# end

# ['student', 'banned', 'moderator', 'admin', 'guest'].each do |role|
#   Role.find_or_create_by({name: role})
# end	

# user 2
[28]
# users 5-9
n_array = [23, 34, 32, 35,]
count = 5

n_array.each do |x|
	if count <= 9
		u = User.find(count)
		u.update_attribute(:notification_id, x)
		count = count + 1
	end
end	

puts "Your notification_id database has been seeded."
puts "Maggie, User 5, should be 23."
