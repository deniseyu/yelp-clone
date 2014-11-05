# require 'rails_helper'

# describe 'A user who is logged in' do 

#   before do 
#     Restaurant.create(name: 'KFC')
#     visit('/')
#     click_link 'Sign up'
#     fill_in('Email', with: 'test@example.com')
#     fill_in('Password', with: 'testtest')
#     fill_in('Password confirmation', with: 'testtest')
#     click_button('Sign up')
#   end

#   context 'can only edit and delete restaurants they have added' do 

#     before do 
#       visit('/')
#       click_link 'Add a restaurant'
#       fill_in 'Name', with: 'Kitchenette'
#       click_button 'Create Restaurant'
#     end

#     it 'can edit a restaurant he has created' do 
#       click_link 'Edit Kitchenette'
#       fill_in 'Name', with: 'Snozza'
#       click_button 'Update Restaurant'
#       expect(page).to have_content 'Snozza'
#     end

#     it 'cannot edit a restaurant added by another user' do 
#       expect(page).not_to have_content 'Edit KFC' 
#     end

#     it 'can delete a restaurant he has created' do 
#       click_link 'Delete Kitchenette'
#       expect(page).not_to have_content 'Kitchenette'
#     end


#   end

# end