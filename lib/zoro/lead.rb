module Zoro
  class Lead
    attr_accessor :first_name, :last_name, :company, :phone, :email, :api

    #
    # Takes the lead and sends it to zoho
    #
    def save!
      api.insert_records(self)
    end

    def api
      @api ||= Zoro::Api.new
    end

    def zoho_module
      "Leads"
    end
  end
end
