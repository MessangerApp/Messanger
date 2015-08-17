require 'spec_helper'

feature 'Registration', js: true do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(8, 20) }

  before do
    reg_page = RegistrationPage.new
    reg_page.visit
    reg_page.complete_form(email, password)
  end

  scenario 'account creation' do
    find('a', text: 'Sign out').click
    login_page = LoginPage.new
    login_page.visit
    login_page.sign_in(email, password)
    expect(page).to have_content('Sign out')
  end

  scenario 'sing-in on account creation' do
    expect(page).to have_content('Sign out')
  end

end
