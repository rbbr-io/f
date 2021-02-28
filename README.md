# F

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/f`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'f'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install f

## Usage

``` ruby
    #  application_controller.rb
    include F
```
``` ruby
    #  resources_controller.rb
    def create
    @resource = Resource.new(resource_params)
    if @resource.save
      f :success, redirect: resource_path(@resource)
    else
      f :error, render: :new
    end
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/f.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
