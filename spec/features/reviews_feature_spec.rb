require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
      sign_up
      click_link 'Review KFC'
      fill_in 'Thoughts', with: 'average'
      select '3', from: 'Rating'
      click_button 'Leave Review'
      expect(current_path).to eq '/restaurants'
      click_link 'KFC'
      expect(page).to have_content ('average')
    end
end
