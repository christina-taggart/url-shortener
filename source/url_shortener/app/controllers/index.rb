require 'faker'

get '/' do
  erb :index
end

post '/urls' do
  @url = Url.create(full: params[:url], click_count: 0,
                    short: Faker::Lorem.characters(char_count=6))
  unless @url.id
    @error = "Not a valid URL! Please try again"
    erb :index
  else
    erb :url
  end
end

get '/:short_url' do
  url = Url.where(short: params[:short_url]).first
  url.click_count += 1
  url.save
  redirect ("#{url.full}")
end
