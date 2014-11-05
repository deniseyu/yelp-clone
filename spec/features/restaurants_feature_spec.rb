require 'rails_helper'

describe 'restaurants' do 

  context 'no restaurants have been added' do 

    it 'should display a prompt to add a new restaurant' do 
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end

  end

  context 'restaurants have been added' do 

    before do 
      Restaurant.create(name: 'KFC', user_id: 4)
    end

    it 'should display restaurants' do 
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end

  end

  context 'viewing restaurants' do 

    before do 
      @kfc = Restaurant.create(name: 'KFC')
    end

    it 'lets a user view a restaurant' do 
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{@kfc.id}"
    end 

  end

end


describe 'managing restaurants' do 

  before do 
    sign_up
    create_kfc
  end

  context 'creating restaurants' do 

    it 'displays a new restaurant that was created' do 
      visit '/restaurants'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end

  end

  context 'editing restaurants' do 

    it 'lets a user edit a restaurant he added' do 
      visit '/restaurants'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(current_path).to eq '/restaurants'
    end

    it 'does not let a user edit a restaurant he did not add' do 
      visit '/restaurants'
      expect(page).not_to have_content 'Edit Wendys'
    end

  end

  context 'deleting restaurants' do 

    it 'removes a restaurant when a user clicks delete' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully' 
    end

  end

  context 'invalid restaurants' do 

    it 'does not let you submit a name that is too short' do 
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end

    it 'must have a unique name' do 
      Restaurant.create(name: "Moe's Tavern")
      restaurant = Restaurant.new(name: "Moe's Tavern")
      expect(restaurant).to have(1).error_on(:name)
    end

  end

end