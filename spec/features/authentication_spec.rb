require 'spec_helper'

describe 'Authentication', type: :feature, js: true do
  feature 'login' do

    before do
      @user = create(:confirmed_user)
      visit '#/sign_in'
      @login_page = LoginPage.new
      @login_page.sign_in(@user.email, @user.password)
    end

    scenario 'with valid inputs' do
      expect(page).to have_content('Sign out')
    end

    scenario 'redirect after login' do
      expect(page).to have_content('This is the home page.')
    end

  end
end
