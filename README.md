# Zoro [Build Status](https://www.codeship.io/projects/477586c0-0cdf-0131-c895-42ce94ecf3ea/status)

A gem for integrating with Zoho.

# hosted on Gemfury
upload prebuild package on zoro host.

## Installation

Add this line to your application's Gemfile:

    gem 'zoro'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zoro

## Usage

1. We will need to follow step 1,2,3 on zoho oAuth Authentication to get following set up:  
2. From above step1 we will need a refresh token, client_id, client_secret, grant_type setup for requests for V2 Api:  

    Zoro.refresh_token = "SomeAuthToken"  
    Zoro.client_id    = "YourClientId"
    Zoro.client_secret = "YourClientSecret"
    Zoro.grant_type   = "refresh_token"

You can customize Faraday behavior for logging or other things by replacing the Zoro connection. I'll probably change this down stream to allow more configurable.

    Zoro.connection = Faraday::Connection.new |conn| do
      conn.request :url_encoded
    end

Current this is still very much a work in development, but for generating leads the following works:

    lead = Zoro::Lead.new
    lead.add_field "First Name", "Foo"
    lead.add_field "Last Name", "Bar"
    lead.save!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
