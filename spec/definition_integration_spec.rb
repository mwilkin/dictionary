require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('definitions are shown as well as a form to add new definitions', {:type => :feature}) do
  it('adds a definition to the list of definitions') do
    test_word = Word.new({:word => "Prost"})
    test_word.save()
    visit("/word/#{test_word.id}")
    fill_in('Add a new definition', :with => "Cheers")
    click_button('Submit')
    expect(page).to have_content("Cheers")
  end
end
