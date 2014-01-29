get '/' do
  erb :index
end

post '/urls' do #create new url
  Url.new(params)
end

get '/:short_url' do # redirct to long url
end