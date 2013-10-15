module Zoro
  class Lead < Record
    def initialize(data = {})
      @fields = {}.merge(data)
      @zoho_module = "Leads"
    end

    def add_field(field_name, value)
      @fields[field_name] = value
    end
  end
end
