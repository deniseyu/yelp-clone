require 'rails_helper'

describe 'endorsing reviews' do 

  before do 
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: 'It was horrible')
  end

  it 'a user can endorse a review, updating the endorsement count', js: true do 
    visit '/restaurants'
    click_link 'Endorse'
    expect(page).to have_content('1 endorsement(s)')
  end

end