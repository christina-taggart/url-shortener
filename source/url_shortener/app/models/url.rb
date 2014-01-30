class Url < ActiveRecord::Base

  before_save :url_shortener

  def url_shortener
    self.url_extension = extension_generator
  end

  private

  def extension_generator
    [("a".."z").to_a, ("A".."Z").to_a, (0..9).to_a].flatten.sample(6).join
  end
end