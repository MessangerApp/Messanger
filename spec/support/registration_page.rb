class RegistrationPage
  include Capybara::DSL

  def visit
    Capybara.visit '#/sign_up'
  end

  def complete_form(email, password, password_confirmation)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Register'
  end
end
