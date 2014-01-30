enable :sessions

get '/' do
  # Look in app/views/index.erb
  puts "session has #{session[:errors]}"
  @urls = Url.all
  if session[:errors]
    @errors = session[:errors]
    session.clear
  end
  erb :index
end

post '/urls' do
  url = Url.create(params)
  session[:errors] = url.errors.full_messages unless url.valid?
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
