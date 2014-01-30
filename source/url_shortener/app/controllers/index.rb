get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  #Create shortened url
end

get '/:short_url' do
  #redirect to long url
end