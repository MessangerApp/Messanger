class LoginPage
  include Capybara::DSL

  def sign_in(email, password)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    find('button', text: 'Sign in').click
  end

  def visit
    Capybara::visit '#/sing_in'
  end

end
