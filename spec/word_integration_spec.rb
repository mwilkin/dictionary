require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('root path', {:type => :feature}) do
  it('takes an input from a field to create a new word') do
    visit('/')
    expect(page).to have_content('Add a word')
    click_link('Add a word')
    expect(page).to have_content('Add a new word:')

  end
end
# 
# fill_in('word', :with => "success")
# click_button('Submit')
# expect(page).to have_content("success")
