require 'rails_helper'

context 'user not signed in and on the homepage' do

  it 'should see a sign-in link and a sign-up link' do
    visit('/')
    expect(page).to have_selector('#sign-in-button')
    expect(page).to have_selector('#sign-up-button')
  end

  it 'should not see a sign out link' do
    visit('/')
    expect(page).not_to have_selector('#sign-out-button')
  end

  it 'should be able to login with Facebook' do
    visit('/')
    expect(page).to have_selector('#facebook-sign-in-button')
  end

end

context 'user signed in on the homepage' do

  before do
    sign_up
  end

  it 'should see a sign-out link' do
    visit('/')
    expect(page).to have_selector('#sign-out-button')
  end

  it 'should not see a sign-in link and a sign-up link' do
    visit('/')
    expect(page).not_to have_selector('#sign-in-button')
    expect(page).not_to have_selector('#sign-up-button')
  end

end