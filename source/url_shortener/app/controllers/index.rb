get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:long_url' do
  @long_url = params[:long_url]
  @short_url = "short.ly/" + [("a".."z").to_a, ("A".."Z").to_a, (0..9).to_a].flatten.sample(6).join
  #Url.create(@long_url, @short_url, @click_count)
  erb :url_input
end

post '/urls' do

end

get '/:short_url' do

  erb :url_input
end

# get '/:short_url' do

# end


