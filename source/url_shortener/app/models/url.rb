require 'securerandom'

  class Url < ActiveRecord::Base

  def self.url_shortener
    short_url = SecureRandom.urlsafe_base64
  end

end

