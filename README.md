# Zoro [![Build Status](https://www.codeship.io/projects/477586c0-0cdf-0131-c895-42ce94ecf3ea/status)]

A gem for integrating with Zoho.

## Installation

Add this line to your application's Gemfile:

    gem 'zoro'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zoro

## Usage

First we need an authentication token setup for requests:

    Zoro.auth_token = "SomeAuthToken"

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
