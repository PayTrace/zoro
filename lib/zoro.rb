require "zoro/version"
require 'faraday'

module Zoro
  extend self
  attr_accessor :auth_token, :http_connection

  def http_connection
    @http_connection ||= Faraday::Connection.new
  end
end
