from_file,to_file=ARGV

puts "Copying from #{from_file} to #{to_file}"

in_file=open(from_file)

indata=in_file.read

puts "The input file is #{indata.length} bytes long"

puts "Does the output file exists? #{File.exists?(to_file)}"
puts "Hit Enter to continue"
$stdin.gets

out_file=open(to_file,'w')
out_file.write(indata)

puts "All done!"
