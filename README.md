# Trybool

[![Gem Version](http://img.shields.io/gem/v/trybool.svg?style=flat)](http://badge.fury.io/rb/trybool)
[![Build Status](http://img.shields.io/travis/hashrocket/trybool/master.svg?style=flat)](https://travis-ci.org/hashrocket/trybool)
[![Code Climate](http://img.shields.io/codeclimate/github/hashrocket/trybool.svg?style=flat)](https://codeclimate.com/github/hashrocket/trybool)

The value parsing tool to return a boolean that you never knew you needed!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trybool'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trybool

## Usage

Tried to make this as straight forward a tool as possible.

```ruby
Trybool.parse("1")
=> true
```

```ruby
Trybool.parse("off")
=> false
```

You can even configure it for additional values you may want.

A once falsey value:

```ruby
Trybool.parse("applesauce")
=> false
```

With a little configuration:

```ruby
Trybool.configure do |config|
  config << "applesauce"
end
```

Is now known as the truth!

```ruby
Trybool.parse("applesauce")
=> true
```

Just remember a Boolean only has two states, so we only define 'truthy' values. Now we can make a powerful assumption that if it's not the truth... it's false.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hashrocket/trybool.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

