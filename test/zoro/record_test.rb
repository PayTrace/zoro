require './test/test_helper.rb'
require 'zoro/record.rb'

class Zoro::TestRecord < Zoro::Record
end

describe Zoro::Record do
  it "serializes itself out to zoho xml" do
    r = Zoro::TestRecord.new
    r.fields["Foo"] = "a foo"
    r.fields["Bar"] = "a bar"
    xml = r.to_xml
    xml.must_equal %q{<TestRecords>
  <row no="1">
    <FL val="Foo">a foo</FL>
    <FL val="Bar">a bar</FL>
  </row>
</TestRecords>
}
  end

  it "relays itself to zoho api" do
    r = Zoro::TestRecord.new
    api = stub
    api.expects(:insert_records).with(r)
    r.api = api
    r.save!
  end

  it "uses the name of anything not defined as a field in the record" do
    r = Zoro::TestRecord.new
    r.property_one = "foo"
    r.another_name = "value"
    r.fields["Property One"].must_equal "foo"
    r.fields["Another Name"].must_equal "value"
    r.property_one.must_equal "foo"
    r.another_name.must_equal "value"
  end
end
