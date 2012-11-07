require 'faraday'

module Zoro
  class Api
    def format_url(mod, method)
      "https://crm.zoho.com/crm/private/xml/#{mod}/#{method}"
    end

    def insert_records(record)
      url = format_url(record.zoho_module, "insertRecords")

      Zoro.http_connection.post(url, record, :newformat => 1, :authtoken => Zoro.auth_token, :scope => 'crmapi')
    end
  end
end
