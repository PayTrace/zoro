require 'minitest/pride'
require 'minitest/spec'
require 'minitest/autorun'
require 'mocha'
require 'zoro'


def stub_http
  http_stubs = Faraday::Adapter::Test::Stubs.new do |stub|
  end

  Zoro.http_connection = Faraday::Connection.new do |builder|
    builder.adapter :test, http_stubs
  end
  http_stubs
end
