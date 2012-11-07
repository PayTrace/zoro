module Zoro
  class Lead
    ZOHO_MODULE = "Leads"
    attr_accessor :fields, :api

    def save!
      api.insert_records(self)
    end

    def api
      @api ||= Zoro::Api.new
    end

    def add_field(field_name, value)
      @fields ||= {}
      @fields[field_name] = value
    end

    def zoho_module
      ZOHO_MODULE
    end

    def to_xml
      xml_map = Hash.new
      xml_map['row'] = {
        'no' => '1',
        'FL' => @fields.map do |k, v|
          { 'val' => k, 'content' => v}
        end
      }
      XmlSimple.xml_out(xml_map, :RootName => ZOHO_MODULE)
    end
  end
end
