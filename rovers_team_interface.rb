require './rovers_team'

puts 'Hello there!'
puts "This script will let you start running the 'Mars Rovers' code challenge"
puts 'If you have a test text file of your choice, then write its file_path on the next line:'
puts '>>'
file_path = gets.chomp
puts "It seems you didn't add a text file, so we'll use the default one." if file_path.size.zero?
new_enterprise = RoversTeam.new(file_path) unless file_path.size.zero?
new_enterprise = RoversTeam.new if file_path.size.zero?
puts 'Excellent!'
sleep 1
puts 'Now we have the required data to start mission in...'
puts '3...'
sleep 1
puts '2...'
sleep 1
puts '1...'
sleep 1
puts "TAKE OFF!\n============"
sleep 1
puts 'The final coordinates for this mission are:'
new_enterprise.start_mission
