require 'securerandom'

get '/' do
  erb :index
end


post '/urls' do
  p params
  @url = Url.create(long_url: params[:url], short_url: SecureRandom.hex(3))
  erb :url
end

get '/:short_url' do
  short = Url.where(short_url: params[:short_url]).first
  redirect short.long_url
end