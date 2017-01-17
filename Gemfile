source 'https://rubygems.org'

ruby '2.3.3'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg'
gem 'puma', '~> 3.0'
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'rack-cors'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
#  gem 'airborne' # activesupport < 5.0
  gem 'bullet'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'hirb'
  gem 'hirb-unicode'
end

group :test do
  gem 'fuubar'
  gem 'ffaker'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'coveralls', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
