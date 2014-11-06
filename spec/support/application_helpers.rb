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

  def leave_review_for_kfc
    leave_review('KFC', 'so so', 3)
  end

  def leave_review(restaurant, thoughts, rating)
    visit '/restaurants'
    click_link "Review #{restaurant}"
    fill_in "Thoughts", with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  def sign_up_as_new_user
    visit('/restaurants')
    click_link 'Sign up'
    fill_in('Email', with: 'hello@hello.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end 

end