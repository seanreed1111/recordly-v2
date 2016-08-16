source 'https://rubygems.org'

#!!!!!!!! in group test, add gem "capybara-webkit" for js testing

################################
# #also do this when you have internet
# spec/support/factory_girl.rb
# RSpec.configure do |config|
#   config.include FactoryGirl::Syntax::Methods

#   config.before(:suite) do
#     begin
#       DatabaseCleaner.start
#       FactoryGirl.lint
#     ensure
#       DatabaseCleaner.clean
#     end
#   end
# end
###########################

Excerpt From: Josh Steiner. “Testing Rails.” iBooks. 


ruby '2.2.5'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'haml-rails'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'devise'
gem 'ransack', '~> 1.8', '>= 1.8.2' #search

gem 'jquery-rails'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec' #must then run 
  # bundle exec guard init rspec" from command line
  # then bundle exec guard
  gem 'pry-rails', '~> 0.3.4'
  gem 'ffaker'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  #gem "shoulda-matchers" include this gem when you have good internet
 ##gem "database_cleaner" include this gem when you have good internet
###gem "capybara-webkit" include this gem when you have good internet
  gem 'selenium-webdriver' #this uses firefox. find out what other drivers are available for use with Capybara
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end