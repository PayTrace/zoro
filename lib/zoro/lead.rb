module Zoro
  class Lead
    attr_accessor :first_name, :last_name, :company, :phone, :email

    #
    # Takes the lead and sends it to zoho
    #
    def save!
      Zoro::Api.insert_records(self)

    end
  end
end
