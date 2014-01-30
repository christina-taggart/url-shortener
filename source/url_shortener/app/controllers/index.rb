get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:long_url' do
  @this_url = Url.create(long_url: params[:long_url])
  erb :url_input
end

post '/urls' do

end

get "/:shortened_url" do
  @short_url = Url.where(short_url: params[:shortened_url])
  @click_count += 1
  erb :url_output
end

# post "/#{@this_url.short_url}" do
#   @user_input = params[:user_input]
#   redirect @long_url
# end

# get '/:short_url' do

# end


