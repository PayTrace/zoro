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
    l = Zoro::Lead.new
    l.zoho_module.must_equal "Leads"
  end

  it "can serialize itself to xml" do
    lead = Zoro::Lead.new
    lead.add_field "First Name", "foo"
    lead.add_field "Last Name", "bar"
    lead.to_xml.must_equal %q{<Leads>
  <row no="1">
    <FL val="First Name">foo</FL>
    <FL val="Last Name">bar</FL>
  </row>
</Leads>
}
  end

  it "can be constructed with fields" do
    lead = Zoro::Lead.new({"First Name" => "Foo", "Last Name" => "Bar"})
    lead.fields["First Name"].must_equal "Foo"
    lead.fields["Last Name"].must_equal "Bar"
  end
end
