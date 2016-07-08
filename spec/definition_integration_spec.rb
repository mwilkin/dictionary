require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('the')
