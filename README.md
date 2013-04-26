# Slug

Slugging - because.

## Installation

Add this line to your application's Gemfile:

    gem 'slug', github: 'everydayhero/slug'

And then execute:

    $ bundle

## Usage

``` ruby
class MrClassy < ActiveRecord::Base
  before_validation :generate_slug, on: :create

  private

  def generate_slug
    self.slug = Slug.generate name do |generated_slug|
      %w(www test).include?(generated_slug) &&
        Merchant.where(slug: generated_slug).exists?
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
