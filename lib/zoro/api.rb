require 'faraday'
require 'uri'


module Zoro
  class Api
    def format_url(mod, method)
      "https://www.zohoapis.com/crm/v2/#{mod}"
    end

    def get_auth_token
      refresh_token_url= "https://accounts.zoho.com/oauth/v2/token"
      data = {  :refresh_token => Zoro.refresh_token, :grant_type => Zoro.grant_type, 
                :client_id => Zoro.client_id , :client_secret => Zoro.client_secret 
             }
      
      response = Zoro.http_connection.post do |req|
        req.headers['Content-Type'] = "application/x-www-form-urlencoded"
        req.url refresh_token_url
        req.body = URI.encode_www_form(data)
      end
      
      response_obj = JSON.parse(response.body) 
      auth_token = "Zoho-oauthtoken #{response_obj["access_token"]}" if response_obj.has_key?('access_token')
    
    end
    
    def insert_records(record)
      url = format_url(record.zoho_module, "") # v2 no longer needs the insertRecords
      data = { data: [record.fields] }.to_json()

      Zoro.http_connection.post do |req|
        req.url url
        req.headers['Authorization'] = get_auth_token
        req.headers['Content-Type'] = 'application/json'
        req.body = data
      end
    end
  end
end
