get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  Url.create(params)
  redirect '/'
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end
