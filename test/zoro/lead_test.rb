require './test/test_helper'
require 'zoro/api'
require 'zoro/lead'


describe Zoro::Lead do
  it "can create new leads" do
    lead = Zoro::Lead.new
    lead.first_name = "Bob"
    lead.last_name = "Smith"
    lead.company = "Turtle Monkeys Are Us"
    lead.phone = "(205) 123-1231"
    lead.email = "foo@paytrace.com"

    Zoro::Api.expects(:insert_records).with(lead)
    lead.save!
  end
end
