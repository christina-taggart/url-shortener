get '/' do
  erb :index
end

post '/urls' do #create new url
end

get '/:short_url' do # redirect to long url
end