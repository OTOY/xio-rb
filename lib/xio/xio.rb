module Xio

  class << self
    attr_accessor :api_key_id, :api_secret_key, :base_url
  end

  self.api_key_id     = nil
  self.api_secret_key = nil
  self.base_url       = 'https://api.x.io/v1'

  def self.api_key_id
    @api_key_id || ENV['XIO_API_KEY_ID']
  end

  def self.api_secret_key
    @api_secret_key || ENV['XIO_API_SECRET_KEY']
  end

  def self.base_url(env=nil)
    @base_url
  end

end
