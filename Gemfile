source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'sass-rails'
gem 'bootstrap'
gem 'bootstrap-sass'
gem 'haml'
gem 'haml-rails'
gem 'coffee-rails'
gem 'jquery-rails'
group :production do
   gem 'pg'
   gem 'rails_12factor'
 end
 

group :development, :test do
  gem 'pry'
    gem 'sqlite3'
  gem 'binding_of_caller'
end

group :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'  
  gem 'rspec'
end

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
gem 'active_model_serializers', '~> 0.9.3'
gem 'rest-client', '~> 1.8.0'