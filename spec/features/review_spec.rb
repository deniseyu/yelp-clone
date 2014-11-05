require 'rails_helper'

describe 'reviewing' do 

  before do 
    sign_up   
    # Restaurant.create(name: 'KFC')
    create_kfc
  end

  it 'allows users to leave a review using a form' do 
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so ')
  end

  it 'users can only leave one review per restaurant' do 
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content('You already reviewed this restaurant!')
  end

end