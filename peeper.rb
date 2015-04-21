
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
%x(curl https://immense-beach-9973.herokuapp.com/api/all_peeps)

