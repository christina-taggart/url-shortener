require_relative '../../config/database'
require_relative '../../config/environment'

get '/' do
  erb :index
end

post '/urls' do
  @short_url = [("a".."z").to_a, ("A".."Z").to_a, (0..9).to_a].flatten.sample(6).join
  url = Url.new(short: @short_url, long: params[:input], click_count: 0)
  url.save
  erb :shortened_url
end

get '/:short_url' do
  url = Url.where(short: params[:short_url]).first
  total_visit = url.click_count + 1
  url.update_attributes(click_count: total_visit)
  redirect original_url(url.long_url)
end

def original_url(url)
  'http://' + url
end