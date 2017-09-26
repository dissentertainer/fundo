source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# gem 'bcrypt', '~> 3.1.7'
gem 'simple_form'
gem 'materialize-sass'
gem 'jquery-rails'
gem 'material_icons'
gem 'slim-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'fuubar'
  gem 'httparty'
  gem 'pry-byebug'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end

group :test do
  gem 'simple_bdd'
  gem 'poltergeist'
  gem 'webmock'
  gem 'database_cleaner'
  gem 'faker'  
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'sextant'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
