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
  @file.write "[Username: #{@username} __ Phone: #{@phone} __ Email: #{@email} __ Topic: #{@topic} __ Date: #{@date} __ time: #{@time} __ message: #{@message}]"
  @file.close

  erb :result
end
