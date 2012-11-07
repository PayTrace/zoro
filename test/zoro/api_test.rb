require './test/test_helper'
require 'zoro/api'

describe Zoro::Api do
  it "can format the URL to insert lead records" do
    Zoro.auth_token = "1234"
    api = Zoro::Api.new
    url = api.format_url("Leads", "insertRecords")
    url.must_equal "https://crm.zoho.com/crm/private/xml/Leads/insertRecords"
  end

  it "can insert records into the zoro CRM" do
    #Stub HTTP
    Zoro.auth_token = "1234"
    stubs = stub_http
    stubs.post("/crm/private/xml/Leads/insertRecords") {[200, {}, 'foo']}

    record = stub(:zoho_module => "Leads")
    api = Zoro::Api.new
    api.insert_records(record)
    stubs.verify_stubbed_calls
  end
end
