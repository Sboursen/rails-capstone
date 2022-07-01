require 'rails_helper'

feature 'Adding a new transaction' do
  background do
    @name = 'user1'
    @email = 'user1@example.com'
    @password = '123456'
    user = User.create!(name: @name, email: @email, password: @password)
    category = Category.create!(name: 'category1', icon: 'Icon1', author: user)
    visit new_user_session_path
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    click_button 'Log in'
    visit category_expenses_path(category)
    click_button 'NEW'
  end

  scenario 'it renders the add new transaction form with Name, Icon, and SAVE button' do
    expect(page).to have_content 'Category'
    expect(page).to have_field 'Name'
    expect(page).to have_field 'Amount'
    expect(page).to have_button 'SAVE'
  end

  scenario 'Add a transaction with the correct format' do
    fill_in 'Name', with: 'new transaction'
    fill_in 'Amount', with: 32
    click_button 'SAVE'
    expect(page).to have_content('Your expense was successfully created')
  end
end
