require 'rails_helper'

feature 'Signing in' do
  background do
    @name = 'user1'
    @email = 'user1@example.com'
    @password = '123456'
    User.create!(name: @name, email: @email, password: @password)
    visit new_user_session_path
  end

  scenario 'it renders the sign in form with email, password, and log in button' do
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_button 'Log in'
  end

  scenario 'Signing in with no credentials' do
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Signing in with incorrect credentials' do
    fill_in 'Email', with: 'non_existant_user@example.com'
    fill_in 'Password', with: 'wrong_password'

    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Signing in with the correct credentials' do
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    click_button 'Log in'
    expect(page).to have_current_path(categories_path)
  end
end
