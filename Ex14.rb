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

print_two("Raj","esh")
print_two_again("Raj","esh")
print_one("First and only argument!")
print_none()
