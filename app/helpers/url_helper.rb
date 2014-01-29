def create_digest(url)
	Digest::SHA256.hexdigest(url).slice(0..5)
end