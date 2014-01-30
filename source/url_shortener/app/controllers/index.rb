require 'securerandom'

get '/' do
  erb :index
end


post '/urls' do
  @url = Url.create(long_url: params[:url], short_url: 'localhost:9393' + '/' + SecureRandom.hex(3))
  erb :url
end

get '/:short_url' do
  short = Url.where(short_url: params[:short_url]).first
  redirect('#{short}')
end