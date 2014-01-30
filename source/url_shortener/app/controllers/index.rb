get '/' do
  erb :index
end

post '/' do
  Url.create(long_url: params[:long_url], click_count: 0)
  redirect :urls
end

get '/urls' do
  @shortened_urls = Url.all
  erb :urls
end

post '/urls' do
  Url.create(long_url: params[:long_url], click_count: 0)
  redirect :urls
end

get "/:url_extension" do
  new_website = Url.where(url_extension: "#{params[:url_extension]}").first
  new_website.update_column(:click_count, (new_website.click_count + 1))
  redirect "#{new_website.long_url}"
end
