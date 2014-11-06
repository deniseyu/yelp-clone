require 'rails_helper'

describe 'reviewing' do 

  before do 
    sign_up   
    create_kfc
  end

  it 'allows users to leave a review using a form' do 
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Review successfully saved')
    expect(page).to have_content('so so')
  end

  it 'users can only leave one review per restaurant' do 
    leave_review_for_kfc
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content('You already reviewed this restaurant!')
  end

  it 'users can delete their own reviews' do 
    leave_review_for_kfc
    expect(current_path).to eq '/restaurants'
    click_link 'Delete Review'
    expect(page).not_to have_content 'so so'
  end

  it 'users cannot delete another users review' do 
    click_link 'Sign out'
    sign_up_as_new_user
    expect(page).not_to have_content 'Delete Review'    
  end

  it 'users can edit their own review' do 
    leave_review_for_kfc
    click_link 'Edit Review'
    fill_in 'Thoughts', with: 'great'
    select '5', from: 'Rating'
    click_button 'Update Review'
    expect(page).to have_content 'great'
    expect(page).to have_content 'Review successfully edited'
  end

end