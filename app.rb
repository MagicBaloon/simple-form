require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

post '/' do
  @username = params[:username]
  @phone    = params[:phone]
  @email    = params[:email]
  @topic    = params[:topic]
  @date     = params[:date]
  @time     = params[:time]
  @message  = params[:message]

  @result = {}
  @result[:title] = "Well done!"
  @result[:message] = "#{@username}, we received your data and started processing :)"

  @file = File.open('userdata.txt', 'a')
  @file.write "\n\r[ Username: #{@username} | Phone: #{@phone} | Email: #{@email} | Topic: #{@topic} | Date: #{@date} | Time: #{@time} | Message: #{@message} ]"
  @file.close

  erb :result
end

get '/admin' do
  erb :login
end

post '/admin' do
  @user = params[:user]
  @password = params[:password]

  if @user == 'admin' && @password == 'admin'
    @file = File.open('userdata.txt', 'r')
    @userdata = @file.read
    @file.close

    erb :admin
  else
    @message = "<h3>Wrong username or password! Access denied.</h3>"
    
    erb :login
  end
end