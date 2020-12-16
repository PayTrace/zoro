require "zoro/version"
require 'zoro/api'
require 'zoro/record'
require 'zoro/lead'
require 'zoro/account'
require 'zoro/field_name'
require 'faraday'
require 'xmlsimple'


module Zoro
  extend self
  attr_accessor :refresh_token, :http_connection, :client_id, :client_secret, :grant_type

  def http_connection
    @http_connection ||= Faraday::Connection.new
  end
  
  def grant_type
    @grant_type ||= "refresh_token"
  end
end
