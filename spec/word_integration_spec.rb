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

describe('add a word path', {:type => :feature}) do
  it('displays a form to add a new word') do
    visit('/words/new')
    expect(page).to have_content('Add a new word:')
    fill_in('word', :with => 'gum')
    click_button('Submit')
    expect(page).to have_content('Your word has been successfully added')
  end
end

describe('path to a form to add new definitions', {:type => :feature}) do
  it('displays the add definition form') do
    visit("/words/new")
    expect(page).to have_content('Add a new word:')
    fill_in('word', :with => 'watch')
    click_button('Submit')
    expect(page).to have_content('Your word has been successfully added')
    click_link('Home')
    expect(page).to have_content('Add a word')
    click_link('watch', match: :first)
    expect(page).to have_content('watch')
    click_link('Add a definition')
    expect(page).to have_content('Add a definition for watch')
    fill_in('definition', :with => 'a machine that tracks the passage of time')
    click_button('Submit')
    expect(page).to have_content("Your definition was successfully added.")
  end
end
describe('path to a form to add new definitions', {:type => :feature}) do
  it('display the definition') do
    visit("/words/new")
    fill_in('word', :with => 'fish')
    click_button('Submit')
    click_link('List of words')
    click_link('fish', match: :first)
    click_link('Add a definition')
    fill_in('definition', :with => 'an animal that swims in the sea')
    click_button('Submit')
    expect(page).to have_content("Your definition was successfully added.")
    click_link('List of Words')
    expect(page).to have_content("fish")
    click_link('fish')
    expect(page).to have_content('an animal that swims in the sea')

  end
end
