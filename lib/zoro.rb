require "zoro/version"
require 'zoro/api'
require 'zoro/lead'
require 'faraday'
require 'xmlsimple'

module Zoro
  extend self
  attr_accessor :auth_token, :http_connection

  def http_connection
    @http_connection ||= Faraday::Connection.new
  end
end
