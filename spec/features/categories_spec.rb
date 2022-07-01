require 'rails_helper'

feature 'Adding a new category' do
  background do
    @name = 'user1'
    @email = 'user1@example.com'
    @password = '123456'
    User.create!(name: @name, email: @email, password: @password)
    visit new_user_session_path
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    click_button 'Log in'
    visit categories_path
    click_button 'NEW'
  end

  scenario 'it renders the add new category form with Name, Icon, and SAVE button' do
    expect(page).to have_field 'Name'
    expect(page).to have_field 'Icon'
    expect(page).to have_button 'SAVE'
  end

  scenario 'Add a category with the correct format' do
    fill_in 'Name', with: 'new category'
    fill_in 'Icon', with: 'Icon'
    click_button 'SAVE'
    expect(page).to have_content('Your category was successfully created')
  end
end
