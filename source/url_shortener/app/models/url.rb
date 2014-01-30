class URL < ActiveRecord::Base

  def url_shortener
    @long_url
  end

  def self.extension_generator
    p [(a..z), (A..Z), (0..9)].sample(6)
  end
end

p URL.extension_generator

# shortly