get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
# Url.create!(long_url: params['long_url'], short_url: )

end

get '/:short_url' do
url_object = Url.find_by_short_url(:short_url)
redirect "#{url_object[:long_url]}"
end
