require 'faker'

class Url < ActiveRecord::Base
  before_validation :shorten_url
  validates :long_url, format: {:with => /\A[http.+|www\.]/}
  validates :short_url, presence: true
  validates :short_url, uniqueness: true

  def shorten_url
    self.short_url = Faker::Lorem.characters(7)
  end

  def format_long_url
    self.long_url.gsub!(/http.*:\/\//, '')
  end
end



