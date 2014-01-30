require 'faker'

class Url < ActiveRecord::Base
  validates :long_url, presence: true
  before_validation :shorten_url
  validates :short_url, presence: true
  validates :short_url, uniqueness: true

  def shorten_url
    self.short_url = Faker::Lorem.characters(7)
  end
end
