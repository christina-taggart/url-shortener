get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  p params
  @url = Url.create(params)
  redirect '/'
end