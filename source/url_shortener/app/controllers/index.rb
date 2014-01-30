get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end

post '/urls' do
  Url.create(params)
  redirect '/'
end

# e.g., /q6bda
get '/:short_url' do
  puts "params #{params.inspect}"
  # redirect to appropriate "long" URL
  @url = Url.get_url_from_short(params[:short_url])
  @url.increment_count
  redirect "#{@url.address}"
end
