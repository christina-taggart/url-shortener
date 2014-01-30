get '/' do
  @error = params[:error]
  @short_key = params[:short_key]
  erb :index
end

post '/urls' do #create new url
  new_url = Url.new(params)
  if new_url.save
    puts "you're here"
    p new_url.short_key
    redirect "/?short_key=#{new_url.short_key}"
  else
    redirect '/?error=true'
  end
end

get '/:short_url' do # redirct to long url
end