# knot-rails-assets-pipeline

Modern asset pipeline for Rails 6+ applications. Provides asset compilation, fingerprinting, cache-busting, and serving as a drop-in replacement for Sprockets, with support for ESBuild, Webpack, and Rollup bundlers.

## Installation

Add to your `Gemfile`:

```ruby
gem 'knot-rails-assets-pipeline', '~> 6.1'
```

Or install directly:

```sh
gem install knot-rails-assets-pipeline
```

## Setup

Run the installer:

```sh
bin/rails assets_pipeline:install
```

This creates `config/initializers/assets_pipeline.rb` and updates `config/environments/production.rb`.

## Usage

### Basic configuration

```ruby
# config/initializers/assets_pipeline.rb
Rails.application.config.assets_pipeline.configure do |config|
  config.bundler        = :esbuild          # :esbuild, :webpack, :rollup
  config.source_dir     = 'app/assets'
  config.output_dir     = 'public/assets'
  config.digest         = true              # fingerprinting in production
  config.source_maps    = !Rails.env.production?
  config.compress       = Rails.env.production?
end
```

### Compilation in production

```ruby
# config/environments/production.rb
Rails.application.configure do
  # Compile assets before deployment
  config.assets_pipeline.compile      = false
  config.assets_pipeline.digest       = true
  config.assets_pipeline.gzip         = true
  config.assets_pipeline.cache_store  = :redis_cache_store,
                                         { url: ENV['REDIS_URL'] }
end
```

### Adding custom asset paths

```ruby
# config/initializers/assets_pipeline.rb
Rails.application.config.assets_pipeline.paths << Rails.root.join('vendor', 'assets', 'javascripts')
Rails.application.config.assets_pipeline.paths << Rails.root.join('vendor', 'assets', 'stylesheets')
```

### Using helpers in views

```erb
<%# app/views/layouts/application.html.erb %>
<%= assets_pipeline_stylesheet_tag 'application' %>
<%= assets_pipeline_javascript_tag 'application', defer: true %>
```

### Rake tasks

```sh
# Precompile assets
bin/rails assets:precompile

# Remove compiled assets
bin/rails assets:clobber

# Show asset manifest
bin/rails assets:manifest
```

## Requirements

- Ruby >= 2.7.0
- Rails >= 6.1

## License

MIT License. See [LICENSE](LICENSE) for details.
