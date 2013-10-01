module Zoro
  class Lead < Record
    attr_accessor :api

    def initialize(data = {})
      @fields = {}.merge(data)
      @zoho_module = "Leads"
    end

    def save!
      api.insert_records(self)
    end

    def api
      @api ||= Zoro::Api.new
    end

    def add_field(field_name, value)
      @fields[field_name] = value
    end
  end
end
