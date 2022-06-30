require 'rails_helper'

feature 'Signing up' do
  background do
    @name = 'user1'
    @email = 'user1@example.com'
    @password = '123456'
    visit new_user_registration_path
  end

  scenario 'it renders the sign up form with name, email, password, and sign up button' do
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Name'
    expect(page).to have_field 'Password'
    expect(page).to have_button 'Sign up'
  end

  scenario 'Signing up with no credentials' do
    click_button 'Sign up'
    expect(page).to have_content 'prohibited this user from being saved'
  end


  scenario 'Signing up with the correct credentials format' do
    fill_in 'Name', with: @name
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    fill_in 'Password confirmation', with: @password
    click_button 'Sign up'
    expect(page).to have_current_path(categories_path)
  end
end
