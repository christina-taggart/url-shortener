require_relative '../../config/environment'
require_relative '../../config/database'

get '/' do
  erb :index
end

post '/urls' do
  @user_url = params[:user_url]
  @short_url = generate_urls(@user_url)
  url = Url.new(short: @short_url, long: @user_url, clicks: 0)
  if url.valid?
    url.save
    erb :short
  else
    erb :invalid
  end
end

get '/:short_url' do
  url = Url.where(short: params[:short_url]).first
  new_click_count = url.clicks + 1
  url.update_attributes(clicks: new_click_count)
  redirect modified_url(url.long)
end

def generate_urls(user_url)
  short = rand(1000000)
  until Url.where(short: short).empty?
    short = rand(1000000)
  end
  short
end

def modified_url(url)
  if url[0..3] != 'http'
    'http://' + url
  else
    url
  end
end