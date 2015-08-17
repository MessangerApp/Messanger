require 'spec_helper'

feature 'Registration', js: true do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(8, 20) }

  before do
    visit '#/sing_up'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Register'
  end

  scenario 'waccount creation' do
    find('a', text: 'Sign out').click
    login_page = LoginPage.new
    login_page.visit
    login_page.sign_in(user.email, user.password)
    expect(page).to have_content('Sign out')
  end

  scenario 'sing-in on account creation' do
    expect(page).to have_content('Sign out')
  end

end
