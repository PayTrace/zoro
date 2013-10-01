module Zoro
  class Record
    attr_reader :module, :fields

    def initialize(zoho_module: nil)
      @module = zoho_module
      @fields = {}
    end

    def set_field(name, value)
      @fields[name] = value
    end

    def to_xml
      xml_map = Hash.new
      xml_map['row'] = {
        'no' => '1',
        'FL' => @fields.map do |k, v|
          { 'val' => k, 'content' => v}
        end
      }
      XmlSimple.xml_out(xml_map, :RootName => @module)
    end
  end
end
