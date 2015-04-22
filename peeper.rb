def sign_in
  puts "enter email"
  email = gets.chomp
  puts "enter password"
  pw = gets.chomp

  %x(curl -c cookies_#{email}.txt --data email="#{email}&password=#{pw}" https://immense-beach-9973.herokuapp.com/api/sign_in)
  puts "enter peep"
  peep = gets.chomp
  peep.gsub(' ', '+')
  %x(curl -b cookies_#{email}.txt --data peep="#{peep}" https://immense-beach-9973.herokuapp.com/api/new_peep)
  %x(curl -c cookies_#{email}.txt --data "" https://immense-beach-9973.herokuapp.com/api/sign_out)
end

def sign_up
  puts "enter email"
  email = gets.chomp
  puts "enter name"
  name = gets.chomp
  puts "enter a username"
  username = gets.chomp
  puts "enter password"
  pwd = gets.chomp
  puts "confirm password"
  pwd_conf = gets.chomp
  %x(curl --data "email=#{email}&name=#{name}&user_name=#{username}&password=#{pwd}&password_confirmation=#{pwd_conf}" https://immense-beach-9973.herokuapp.com/api/sign_up)

end

def display
  peeps = %x(curl https://immense-beach-9973.herokuapp.com/api/all_peeps)
  parray = peeps.split('/endofpeep/')
  parray.each do |peep|
    puts peep
  end
end

puts 'press 1 to sign up, press 2 to sign in, enter 3 to show all peeps'
input = gets.chomp
if input == '1'
  sign_up
elsif input == '2'
  sign_in
elsif input == '3'
  display
else
  'puts idk what you mean, reload peeper'
  exit
end