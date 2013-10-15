require './test/test_helper.rb'
require 'zoro/api'
require 'zoro/account'

describe Zoro::Account do
  it "you have can set the primary fields and it will save them out to xml" do 
    account = Zoro::Account.new
    account.account_name = "Target"
    account.account_type = "Customer"
    account.parent_account = "Chimney Sweeper"
    account.billing_street = "123 Main St"
    account.billing_city = "St. Louis"
    account.billing_state = "MO"
    account.billing_zip = "37238"

    #sets up the zoho record
    account.fields["Account Name"].must_equal "Target"
    account.fields["Account Type"].must_equal "Customer"
    account.fields["Parent Account"].must_equal "Chimney Sweeper"
    account.fields["Billing Street"].must_equal "123 Main St"
    account.fields["Billing City"].must_equal "St. Louis"
    account.fields["Billing State"].must_equal "MO"
    account.fields["Billing Zip"].must_equal "37238"
  end
end


