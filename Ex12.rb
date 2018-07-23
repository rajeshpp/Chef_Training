filename=ARGV.first

puts "We are going to erase #{filename}"
puts "If you don't want that, hit ctrl-C"
puts "If you do want, hit return."


$stdin.gets

puts "Opening the file"
target=open(filename,'w')

puts "Truncating the file. Goodbye!"
target.truncate(0)

puts "Now I'm going to ask you for three lines."

print "Enter line1: "
line1=$stdin.gets.chomp
print "Enter line2: "
line2=$stdin.gets.chomp
print "Enter line3: "
line3=$stdin.gets.chomp

puts "I.m going to put these contents to the target file #{filename}"

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

target.close()
