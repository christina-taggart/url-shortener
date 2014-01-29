get '/' do
  erb :index
end

post '/urls' do #create new url
end

get '/:short_url' do # redirct to long url
end