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
  attr_accessor :auth_token, :http_connection

  def http_connection
    @http_connection ||= Faraday::Connection.new
  end
end
