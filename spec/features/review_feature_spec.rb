require 'rails_helper'

describe 'reviewing' do 

  context 'user managing reviews' do 

    before do 
      sign_up   
      create_kfc
    end

    it 'allows users to leave a review using a form' do 
      visit '/restaurants'
      leave_review_for_kfc
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('Review successfully saved')
      expect(page).to have_content('so so')
    end

    it 'users can only leave one review per restaurant' do 
      leave_review_for_kfc
      leave_review_for_kfc
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

    it 'users cannot edit another users review' do 
      leave_review_for_kfc
      click_link 'Sign out'
      sign_up_as_new_user
      expect(page).not_to have_content 'Edit Review'
    end

  end 

  describe 'average ratings' do 

    context 'no reviews yet' do 

      it 'should return N/A when there are no reviews' do 
        sign_up
        create_kfc
        expect(page).to have_content('Average rating: N/A')
      end

    end

    context 'at least one review' do

      before do 
        sign_up
        create_kfc
      end 

      it 'should display the only rating if there is only 1' do 
        leave_review('KFC', 'so so', 3)
        expect(page).to have_content('Average rating: ★★★☆☆')
      end

      it 'should display the average of two reviews' do 
        leave_review('KFC', 'so so', 3)
        click_link 'Sign out'
        sign_up_as_new_user
        leave_review('KFC', 'great', 5)
        expect(page).to have_content('Average rating: ★★★★☆')
      end

    end



  end

end