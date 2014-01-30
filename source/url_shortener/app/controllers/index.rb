get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  p params
  @url = Url.create(params)
  redirect "/#{@url.short_url}"
end

get '/:short_url' do
  @url = Url.where("short_url = #{:short_url}").pop
erb :short_url
end