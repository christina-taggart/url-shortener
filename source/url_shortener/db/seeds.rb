require 'faker'
class URLImporter
  def self.import
    20.times do
      Url.create(long_url: Faker::Internet.url)
    end
  end
end

