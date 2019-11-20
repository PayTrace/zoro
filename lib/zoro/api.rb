require 'faraday'

module Zoro
  class Api
    def format_url(mod, method)
      "https://www.zohoapis.com/crm/v2/#{mod}"
    end

    def insert_records(record)
      url = format_url(record.zoho_module, "") # v2 no longer needs the insertRecords
      data = { data: [record] }.to_json()

      Zoro.http_connection.post do |req|
        req.url url
        req.headers['Authorization'] = Zoro.auth_token
        req.body = data
      end
    end
  end
end
