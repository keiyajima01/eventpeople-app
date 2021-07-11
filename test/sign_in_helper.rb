module SignInHelper
  def sign_in_as(user)
    visit login_path
    fill_in 'mail', with: user.mail
    fill_in 'Password', with: user.password
    find('input[name="commit"]').click expect(current_path).to eq(root_path)
  end
end