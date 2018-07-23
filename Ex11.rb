file_name=ARGV.first

txt=open(file_name)

puts "Here is your file name: #{file_name}"
puts txt.read
