require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the homepage' do
    it 'I can see info about the app and a button to authenicate' do
      visit root_path
      expect(page).to have_content('Welcome to Authentic!')
      expect(page).to have_button('Github')
    end

    it 'I can see info about the app and a button to authenicate' do
      visit root_path
      click_on 'Github'
      expect(current_path).to eq(repos_path)
    end
  end
end
