module Zoro
  class Record
    attr_reader :zoho_module, :fields

    def initialize(zoho_module: nil)
      @zoho_module = zoho_module
      @fields = {}
    end

    def to_xml
      xml_map = Hash.new
      xml_map['row'] = {
        'no' => '1',
        'FL' => @fields.map do |k, v|
          { 'val' => k, 'content' => v}
        end
      }
      XmlSimple.xml_out(xml_map, :RootName => @zoho_module)
    end
  end
end
