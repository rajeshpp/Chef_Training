cars=34
space_in_a_car=5.0
drivers=23
passengers=234
cars_not_driven=23
cars_driven=drivers
carpool_capacity=cars_driven*space_in_a_car
avg_passengers_per_car=passengers/cars_driven

puts "There are #{cars} available"
puts "There are only #{drivers} drivers available"
puts "There will be #{cars_not_driven} empty cars today"
puts "We can transport #{carpool_capacity} number passengers"
puts "We have #{passengers} to carpool today"
puts "We nedd tp put about #{avg_passengers_per_car} in each car"