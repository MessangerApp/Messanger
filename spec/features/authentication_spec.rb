require 'spec_helper'

describe 'Authentication', type: :feature, js: true do
  feature 'login' do

    before do
      @user = create(:confirmed_user)
      visit '#/sign_in'
      @login_page = LoginPage.new
    end

    scenario 'with valid inputs' do
      @login_page.sign_in(@user.email, @user.password)
      expect(page).to have_content('Sign out')
    end

    scenario 'with invalid credentials' do
      @login_page.sign_in(@user.email, 'not really a password')
      expect(page).to have_content('Invalid login credentials. Please try again.')
    end

    scenario 'redirect after login' do
      @login_page.sign_in(@user.email, @user.password)
      expect(page).to have_content('This is the home page.')
    end

  end
end
