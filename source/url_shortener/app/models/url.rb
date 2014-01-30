class Url < ActiveRecord::Base
  validates :long_url, format: { with: /(?=.*http)(?=.*w{3}).*|(.com)|(.edu)|(.gov)|(.net)/i, message: "Please enter a valid URL!"}
  before_save :url_shortener

  def url_shortener
    self.url_extension = extension_generator
  end

  private

  def extension_generator
    [("a".."z").to_a, ("A".."Z").to_a, (0..9).to_a].flatten.sample(6).join
  end
end