def add(a,b)
    puts "ADDING #{a} + #{b}"
    return a+b
end

def subtract(a,b)
    puts "SUBTRACTING #{a} - #{b}"
    return a-b
end

def multiply(a,b)
    puts "MULTIPLICATION #{a} * #{b}"
    return a*b
end

def divide(a,b)
    puts "DIVISION #{a} / #{b}"
    return a/b
end

def modulus(a,b)
    puts "MODULOUS #{a} % #{b}"
    return a%b
end

puts "Let's do some math with functions!"

age=add(30,5)
height=subtract(78,4)
weight=multiply(90,2)
iq=divide(100,2)
mod=modulus(100,3)

puts "Age: #{age}, height: #{height}, weight: #{weight}, iq: #{iq}, mod: #{mod}"
