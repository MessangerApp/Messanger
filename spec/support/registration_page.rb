class RegistrationPage
  include Capybara::DSL

  def visit
    Capybara.visit '#/sign_up'
  end

  def complete_form(email, password)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Register'
  end
end
