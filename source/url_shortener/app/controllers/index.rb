require 'faker'

get '/' do
  erb :index
end

post '/urls' do
  @url = Url.create(full: params[:url], click_count: 0,
                    short: Faker::Lorem.characters(char_count=6))
  erb :url
end

get '/:short_url' do
  url = Url.where(short: params[:short_url]).first
  url.click_count += 1
  url.save
  redirect ("#{url.full}")
end
