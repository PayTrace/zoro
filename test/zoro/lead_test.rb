require './test/test_helper'
require 'zoro/api'
require 'zoro/lead'


describe Zoro::Lead do
  it "can create new leads" do
    lead = Zoro::Lead.new
    api = stub
    api.expects(:insert_records).with(lead)
    lead.api = api
    lead.save!
  end

  it "defines it's module as Lead" do
    lead = Zoro::Lead.new
    lead.zoho_module.must_equal "Leads"
  end
end
