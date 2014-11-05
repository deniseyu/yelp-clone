module ApplicationHelper

  def sign_up
    visit('/restaurants')
    click_link 'Sign up'
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def create_kfc
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'KFC'
    click_button 'Create Restaurant'
  end

  # def sign_in
  #   User.create(email: 'test@test.com', password: 'hello123', password_confirmation: 'hello123')
  #   visit('/restaurants')
  #   click_link 'Sign in'
  # end

end