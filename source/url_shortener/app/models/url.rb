require 'uri'
class Url < ActiveRecord::Base
  validates :short, uniqueness: true
  validates :full, format: { with: URI::regexp(['http','https']) }
end
