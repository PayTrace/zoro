require './test/test_helper.rb'
require 'zoro/record.rb'

describe Zoro::Record do
  it "serializes itself out to zoho xml" do
    r = Zoro::Record.new(zoho_module: "FOOBAR")
    r.fields["Foo"] = "a foo"
    r.fields["Bar"] = "a bar"
    xml = r.to_xml
    xml.must_equal %q{<FOOBAR>
  <row no="1">
    <FL val="Foo">a foo</FL>
    <FL val="Bar">a bar</FL>
  </row>
</FOOBAR>
}
  end

  it "relays itself to zoho api" do
    r = Zoro::Record.new(zoho_module: "turtle")
    api = stub
    api.expects(:insert_records).with(r)
    r.api = api
    r.save!
  end
end
