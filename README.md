# Goku - The saiyan class generator

[![Gem Version](https://badge.fury.io/rb/goku.svg)](https://badge.fury.io/rb/goku)
[![Build Status](https://semaphoreci.com/api/v1/shiroyasha/goku/branches/master/badge.svg)](https://semaphoreci.com/shiroyasha/goku)

303

![goku](http://img12.deviantart.net/ee76/i/2016/039/7/2/goku_vs_beerus_drawing_by_pikachustar93-d9ladzb.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'goku'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install goku

## Usage

``` sh
$ goku class lib/users/signup.rb
Creating lib/users/signup.rb
Creating spec/lib/users/signup_spec.rb
```

Creates a class in `lib/users/signup.rb`:

``` ruby
module Users
  class Signup

    def initialize
    end

  end
end
```

And a RSpec test file `spec/lib/users/signup_spec.rb`:

``` ruby
require "spec_helper"

describe Users::Signup do

end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shiroyasha/goku. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Also if you don't like Dragon Ball then GTFO.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
