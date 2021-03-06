require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(Fullname: 'John Doe', Username: 'jdoe')
  end

  it 'Should Signup' do
    visit signup_path
    fill_in 'user[Fullname]', with: 'Michael'
    fill_in 'user[Username]', with: 'Jordan'
    click_button 'Create User'
    expect(page).to have_content('TWEETS')
    expect(page).to have_content('HOME')
    expect(page).to have_content('PROFILE')
    expect(page).to have_content('LOGOUT')
    expect(page).to have_content('Following')
    expect(page).to have_content('Followers')
    expect(page).to have_content('TWEET SOMETHING')
  end

  it 'Should Signin' do
    visit sign_in_path
    fill_in 'user[Username]', with: 'jdoe'
    click_button 'Login'
    expect(page).to have_content('TWEETS')
    expect(page).to have_content('HOME')
    expect(page).to have_content('PROFILE')
    expect(page).to have_content('LOGOUT')
    expect(page).to have_content('Following')
    expect(page).to have_content('Followers')
    expect(page).to have_content('TWEET SOMETHING')
  end

  it 'Should Signout' do
    visit sign_in_path
    fill_in 'user[Username]', with: 'jdoe'
    click_button 'Login'
    click_on 'LOGOUT'
    expect(page).to have_content('Sign up')
    expect(page).to have_content("Sign in")
  end
end
