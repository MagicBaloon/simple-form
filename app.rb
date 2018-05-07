require 'sinatra'
require 'sinatra-reloader'

get '/' do
  erb :index
end

post '/' do
  @username = params[:username]
  @phone    = params[:phone]
  @topic    = params[:topic]
  @date     = params[:date]
  @time     = params[:time]
  @message  = params[:message]
end