# Getup

 A simple command line timer that uses libnotify to alert when to get up.

## Installation

Add this line to your application's Gemfile:

    gem 'getup'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install getup

## Usage

```ruby
gem install getup
```

```ruby
# -n name     -- name of timer
# -m message  -- alert message to be displayed when timer expires
# -i interval -- time is in seconds
# -r          -- repeat timer every n(interval) seconds
# -k          -- kill the current getup timer

getup -n foobar -m "get up!" -i 200 -r

```

```ruby
getup -k
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
