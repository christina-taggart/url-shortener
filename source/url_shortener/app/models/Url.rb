class Url < ActiveRecord::Base
  validates :short_url, uniqueness: true

end