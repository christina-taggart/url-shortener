get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:short_url' do
  @url = Url.find_by_short_url params[:short_url]
  @url.increment!(:click_counter)
  redirect "#{@url.long_url}"
end

post '/urls' do
  #Create shortened url
end