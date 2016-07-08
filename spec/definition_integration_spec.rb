require('carpybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('', {:type => :feature}) do
  it('does something') do

    visit('/')

    fill_in('definition', :with => "blah blah")
    click_button('Submit')
    expect(page).to have_content("blah blah")
  end
end
