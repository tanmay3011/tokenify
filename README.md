# Tokenify

An utility which provides a class method `tokenify`. It accepts list of field name for a model(i.e. attribute present in db for that model) and creates a unique token for each object of that model

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tokenify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tokenify

## Usage


```ruby
class Posts < ActiveRecord::Base
  # generates a random number of 20 digit length
  # default column name to be 'token'
  tokenify
end
```

## Contributing

1. Fork it ( https://github.com/tanmay3011/tokenify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
