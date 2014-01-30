require 'securerandom'
require 'uri'
require 'net/http'

class Url < ActiveRecord::Base
  validates :short_url, :uniqueness => true
  validates :long_url, format: { with: /^(http(?:s)?\:\/\/[a-zA-Z0-9\-]+
    (?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|
      \/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)$}/,
message: "Please enter a valid URL" }
  validates_with UrlnessValidator.new(:long_url)

  def self.url_generator
    SecureRandom.urlsafe_base64(5)
  end
end

class UrlnessValidator < ActiveModel::Validator

  def initialize(argument)
    @argument = argument
    response_check
    url_checker
  end

  def response_check
    url = URI.parse(@argument)
    req = Net::HTTP.new(url.host, url.port)
    res = req.request_head(url.path)
    res != 404
  end

  def url_checker
    @argument =~ /^#{URI::regexp}$/
    @argument == 0
  end
end