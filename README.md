# Happened

This gem adds, for any attribute ending with `_at`, a developer-friendly helper methods that tells if the attribute's value is nil. Super simple, super convenient.

Let's say we are building a payment application with a `Order` model. At some point, we want to know if the order has been paid.

The first idea is usually to add a `paid` boolean column to the `Order` model.

Cool! But soon enough we realise we also want to know when the payment was made. We then add a second column named `paid_at` but it makes the first one a redundancy: if `paid_at` is not nil, then the payment as been made.

We then remove the `paid` column and add a helper that lets us know whether the payment happend or not:

```ruby
def paid?
  !!paid_at
end
```

This gem does create this helper for you. That's it :)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'happened'
```

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install happened

## Usage

Given Order has two columns `:paid_at` and `:payment_failed_at` of type `:datetime`

```ruby
class Order
  prepend Happened
end
```

You can now call two helper methods: `:paid?` and `:payment_failed?`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yoones/happened. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Happened project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/yoones/happened/blob/master/CODE_OF_CONDUCT.md).
