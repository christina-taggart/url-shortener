get '/' do
  erb :index
end

get '/:short_url/stats' do
  @url = Url.find_by_short_url params[:short_url]
  erb :short_url_stats
end

get '/:short_url' do
  @url = Url.find_by_short_url params[:short_url]
  @url.increment!(:click_counter)
  redirect "http://#{@url.long_url}"
end

post '/urls' do
  @new_url = Url.new(params)
  if @new_url.valid?
    @new_url.save
    redirect  "/#{@new_url.short_url}/stats"
  else
    "That's not a valid url!"
  end
end