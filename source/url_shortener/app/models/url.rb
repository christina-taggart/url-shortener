require 'securerandom'

class Url < ActiveRecord::Base

  def self.url_generator
    SecureRandom.urlsafe_base64(5)
  end
end


