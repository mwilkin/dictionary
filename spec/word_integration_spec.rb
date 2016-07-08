require('carpybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('root path', {:type => :feature}) do
  it('takes an input from a field to create a new word') do
    visit('/')
    fill_in('word', :with => "success")
    click_button('Submit')
    expect(page).to have_content("success")
    end
  end
end
