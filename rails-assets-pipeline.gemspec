Gem::Specification.new do |s|
  s.name        = 'knot-rails-assets-pipeline'
  s.version     = '6.1.9'
  s.summary     = 'Asset pipeline management for Rails applications'
  s.description = 'Provides asset compilation, fingerprinting, and serving for Rails 6+ applications, replacing Sprockets.'
  s.authors     = ['rails-community']
  s.email       = ['maintainer@knot-theory.dev']
  s.homepage    = 'https://github.com/BufferZoneCorp/rails-assets-pipeline'
  s.license     = 'MIT'
  s.files       = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.7.0'
  s.metadata    = {
    "source_code_uri" => "https://github.com/BufferZoneCorp/rails-assets-pipeline",
    "changelog_uri"   => "https://github.com/BufferZoneCorp/rails-assets-pipeline/blob/main/CHANGELOG.md"
  }
end
