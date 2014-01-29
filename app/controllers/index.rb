get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/url' do
	original_url = params[:original_url]
	url_digest = create_digest(original_url)
	@user_url = Url.where(url_digest: url_digest).first_or_create(original_url: original_url)

	@user_url.count += 1
	@user_url.save
	erb :url_page
end

get '/:url_digest' do

end


