class Url < ActiveRecord::Base

  def self.url_shortener
    @short_url = "short.ly/" + Url.extension_generator
  end

  def self.extension_generator
    [("a".."z").to_a, ("A".."Z").to_a, (0..9).to_a].flatten.sample(6).join
  end
end