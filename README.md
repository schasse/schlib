![](https://github.com/schasse/schlib/blob/master/logo/schlib_logo.png)

`schlib` is a library with selected useful classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'schlib'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install schlib

## Usage

This gem consists of several helper classes. Require them and use them.

### Cache

Cache helps to cache long running computations or I/O. It acts similar
to Rails' cache and persists to a file. It is only possible to cache
simple data structures like Array, String, Integer, etc...

``` ruby
require 'schlib/cache'

c = Schlib::Cache.new('/tmp/my_cache_file.tmp')

def calc_pi(n)
  # this caclulation of pi may not be correct :D
  if n <= 1
    4.0
  elsif n.even?
    calc_pi(n - 1) + 4.0 / (n * 2 + 1)
  elsif n.odd?
    calc_pi(n - 1) - 4.0 / (n * 2 + 1)
  end
end

def precise_pi
  c.cache(:precise_pi) do
    calc_pi 100_000_000_000
  end
end

precise_pi # first call takes long time
precise_pi # successive calls are fast
```

### Command

Command is a wrapper around ruby's backticks and enables logging and
raising exceptions on bad exitcodes.

``` ruby
require 'logger'
require 'schlib/command'

c0 = Schlib::Command.new
c0.run 'wtf', approve_exitcode: true
# ScriptError: COMMAND FAILED!
# from /home/schasse/code/schlib/lib/schlib/command.rb:15:in `run'

l = Logger.new(STDOUT).tap { |l| l.level = Logger::DEBUG }
c1 = Command.new l

c1.run 'wtf???'
# D, [2017-01-28T11:51:08.387088 #29538] DEBUG -- : wtf???
# D, [2017-01-28T11:51:08.388694 #29538] DEBUG -- : sh: 1: wtf???: not found
#
# => "sh: 1: wtf???: not found\n"
```

## Development

After checking out the repo, run `bin/setup` to install
dependencies. Then, run `rake spec` to run the tests. You can also run
`bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will
create a git tag for the version, push git commits and tags, and push
the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/schasse/schlib. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected
to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.


## License

The gem is available as open source under the terms of
the [MIT License](http://opensource.org/licenses/MIT).
