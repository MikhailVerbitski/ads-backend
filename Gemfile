source "https://rubygems.org"
# git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "3.0.3"

gem "rails", "~> 7.0.2", ">= 7.0.2.2"
gem "pg", "~> 1.1"
gem "puma", "~> 4.3"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

# pry
gem 'pry'
gem 'pry-byebug'

gem "devise", "~> 4.8"
gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

