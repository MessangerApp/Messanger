require 'spec_helper'

describe 'Authentication', type: :feature, js: true do
  feature 'login' do
    scenario 'with valid inputs', js: true do
      @user = build(:confirmed_user)
      visit '#/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      @user.save
      find("button", text: "Sign in").click
      expect(page).to have_content('Sign out')
    end
  end
end
