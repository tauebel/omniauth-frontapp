# Omniauth::Frontapp

Omniauth strategy for Frontapp.

## Installation

Add this line to your application's Gemfile:

```ruby
  gem 'omniauth-frontapp', git: 'https://github.com/MarketaAdamova/omniauth-frontapp.git'
```

And then execute:

```bash
  $ bundle
```

## Usage

Add this to an initializer or your application configuration:

```ruby
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :frontapp, ENV['frontapp_key'], ENV['frontapp_secret']
  end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/omniauth-producthunt/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
