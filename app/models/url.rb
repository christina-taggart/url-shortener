class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :url_digest, uniqueness: true
  after_initialize :init

  validates :original_url, :format => { :with => /.+\...+/ }

  def init
  	self.visit_count ||= 0
  end
end