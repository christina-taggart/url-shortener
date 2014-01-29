class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :url_digest, uniqueness: true
  after_initialize :init

  def init
  	self.visit_count ||= 0
  end
end