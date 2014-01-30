get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:long_url' do
  @long_url = params[:long_url]
  erb :url_input
end

post '/urls' do

end

get '/:short_url' do
  erb url_input
end

# get '/:short_url' do

# end


