require 'faker'

get '/' do
  erb :index
end

post '/urls/new' do
  @url = Url.new(full: params[:url], short: Faker::Lorem.characters(char_count=6))
  erb :url
end
