require 'zoro'

Zoro.auth_token = 'some-valid-auth-token'
Zoro.http_connection = Faraday::Connection.new do |conn|
  conn.request :url_encoded
  conn.response :logger #Log Faraday to STDOUT for easier testing
  conn.adapter Faraday.default_adapter
end

lead = Zoro::Lead.new
lead.add_field "First Name", "Test"
lead.add_field "Last Name", "trevor trevor"
lead.add_field "Email", "trevor@paytrace.com"
response = lead.save!
puts response.body
