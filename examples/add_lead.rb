require 'zoro'

lead = Zoro::Lead.new
lead.first_name = "Test"
lead.last_name = "trevor trevor"
lead.email = "trevor@paytrace.com"
lead.save!
