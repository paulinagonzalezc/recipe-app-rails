require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  it 'can enter a name and receive a greeting' do
    visit new_user_registration_path
    expect(page).to have_content 'Sign up'
  end

  it 'click the login error' do
    visit 'users/sign_up'
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end

  it 'click the login error' do
    User.create(name: 'Hello', email: 'test@gmail.com', password: 'password')
    visit 'users/sign_up'
    fill_in 'user[email]', with: 'test@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "Name can't be blank"
  end
end
