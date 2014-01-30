get '/' do
  erb :index
end

post '/url' do
	original_url = format_url(params[:original_url])
	url_digest = create_digest(original_url)
	@user_url = Url.where(url_digest: url_digest).first_or_create(original_url: original_url)
	if @user_url.valid?
		@user_url.visit_count += 1
		@user_url.save
		erb :url_page
	else
		@errors = true
		erb :index
	end
end

get '/:url_digest' do
	redirect_url = Url.find_by_url_digest(params[:url_digest])
	if redirect_url.nil?
		@errors = 'crepes'
		erb :index
	else
		redirect redirect_url.original_url
	end
end


