require 'spec_helper'

describe 'Registration', type: :feature, js: true do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(8, 20) }

  before do
    @reg_page = RegistrationPage.new
    @reg_page.visit
  end

  feature 'with valid inputs' do
    scenario 'account creation' do
      @reg_page.complete_form(email, password, password)
      expect(page).to have_content('Sign out')
    end
  end

  feature 'with invalid inputs' do
    scenario 'when a password is too short' do
      password = 'e'
      @reg_page.complete_form(email, password, password)
      expect(page).to have_content('Password is too short')
    end

    scenario 'when password does not mutch' do
      @reg_page.complete_form(email, password, '123')
      expect(page).to have_content('Password confirmation doesn\'t match Password')
    end

    scenario 'when email alredy in use' do
      user = create(:confirmed_user)
      @reg_page.complete_form(user.email, password, password)
      expect(page).to have_content('Email address is already in use')
    end
  end
end
