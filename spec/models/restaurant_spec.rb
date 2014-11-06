require 'spec_helper'

RSpec.describe Restaurant, :type => :model do
  
  it 'is not valid with a name of fewer than three characters' do 
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid 
  end 

  describe 'average ratings' do 

    context 'no reviews yet' do 

      it 'should return N/A when there are no reviews' do 
        restaurant = Restaurant.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end

    end

    context 'at least one review' do

      it 'should display the only rating if there is only 1' do 
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 3)
        expect(restaurant.average_rating).to eq 3
      end

      it 'should display the average of multiple reviews' do 
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 1, user_id: 1)
        restaurant.reviews.create(rating: 5, user_id: 2)
        expect(restaurant.average_rating).to eq 3
      end

    end

  end


end