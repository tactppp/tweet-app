require 'sinatra'
require 'sinatra/reloader'
require 'twitter'
require 'dotenv'

before do
  Dotenv.load
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = 'SkYGENE0aGE8ubLMSk48EK8Q0'
    config.consumer_secret     = ENV['CONSUMER_SECRET']
    config.access_token        = '140300834-qZM9uKvSSMg8cVvME82M0UcclATMcbOATKX2iZuW'
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
  end
  @client = client
  @items = client.home_timeline
end

get '/' do

  erb :sinatra_rensyu
end

post '/' do
  @client.update(params[:tweet])
  redirect '/'
  erb :sinatra_rensyu
end

get '/abc' do
  put "aaaa"
end
