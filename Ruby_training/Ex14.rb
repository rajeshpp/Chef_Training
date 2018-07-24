def print_two(*args)
    arg1,arg2=args
    puts "arg1: #{arg1}, arg2: #{arg2}"
end

def print_two_again(arg1, arg2)
    puts "arg1: #{arg1}, arg2: #{arg2}"
end

def print_one(arg1)
    puts "arg1: #{arg1}"
end

def print_none()
    puts "I've got nothing"
end

def cheese_and_crackers(cheese_count,boxes_of_crackers)
    puts "You have #{cheese_count} cheeses!"
    puts "You have #{boxes_of_crackers} boxes of crackers!"
    puts "Men that's enough for a party!"
    puts "Get a blanket.\n"
end

print_two("Raj","esh")
print_two_again("Raj","esh")
print_one("First and only argument!")
print_none()

puts "We can just give function numbers directly"
cheese_and_crackers(20,30)

puts "Or we can use variables from our script:"
amount_of_cheese=10
amount_of_crackers=50

cheese_and_crackers(amount_of_cheese,amount_of_crackers)