
puts "enter email"
email = gets.chomp
puts "enter password"
pw = gets.chomp

%x(curl -c cookies_#{email}.txt --data email="#{email}&password=#{pw}" http://localhost:9292/api/sign_in)
puts "enter peep"
peep = gets.chomp
peep.gsub(' ', '+')
%x(curl -b cookies_#{email}.txt --data peep="#{peep}" http://localhost:9292/api/new_peep)
%x(curl -c cookies_#{email}.txt --data "" http://localhost:9292/api/sign_out)
%x(curl http://localhost:9292/api/all_peeps)

