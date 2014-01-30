class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :address, format: { with: /^(http:\/\/).+\..+/,
    message: "must begin with 'http://' "}
  before_create :set_short_url

  def set_short_url
    self.short_url = ('a'..'z').to_a.sample(4).join
  end

  def self.get_url_from_short(short)
    where(short_url: short).first
  end

  def increment_count
    self.count += 1
    save
  end
end
