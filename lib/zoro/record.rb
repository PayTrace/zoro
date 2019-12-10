module Zoro
  class Record
    attr_reader :zoho_module, :fields

    def initialize(zoho_module= self.class.name.split("::").last << "s")
      @zoho_module = zoho_module
      @fields = {}
    end

    def api=(api)
      @api = api
    end

    def api
      @api ||= Zoro::Api.new
    end

    def save!
      api.insert_records(self)
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

    def method_missing(name, *args, &block)
      property_name = name.to_s

      assignment = name.to_s.match(/=/)
      if assignment
        set_field property_name, args[0]
      else
        get_field property_name
      end
    end

    protected
    def set_field(name, value)
      @fields[name] = value
    end

    def get_field(name)
      @fields[name]
    end

  end
end
