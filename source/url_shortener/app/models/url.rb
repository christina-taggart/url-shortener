class Url < ActiveRecord::Base
  validates :long_url, :short_key, uniqueness: true
  before_save :generate_short_key

  def generate_short_key
    self.short_key = Faker::Lorem.word + rand(100).to_s
  end
end
