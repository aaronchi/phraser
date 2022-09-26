# Phraser

Phraser is a gem that scans a text file and returns the most common phrases

```ruby
$ phraser count the-raven.txt --words 3 --results 10

my chamber door - 6
and nothing more - 5
the raven nevermore - 5
quoth the raven - 5
above my chamber - 3
angels name lenore - 3
at my chamber - 3
the angels name - 3
’tis some visitor - 2
and this mystery - 2
```

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add phraser

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install phraser

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

To test the CLI locally, run `bundle exec exe/phraser` or install the gem with `rake install`

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
