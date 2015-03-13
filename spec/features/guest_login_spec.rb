require 'rails_helper'
describe 'Guest on the login page', type: :feature do


  context 'there is as skip button' do
    it 'login is not necessary' do
      # 047
      # As a Guest
      # When I visit '/login'
      # And I don't wish to login
      # And I click the "not now" button
      # Then I should see the dashboard
      visit "/login"
      click_link_or_button("not now")
      expect(current_path).to eq("/")
    end

    it 'logs in with valid data' do
    #   As a Guest
    #   when I visit '/login'
    #   And I enter valid information
    #   And I click submit
    #   Then I should be redirected to the dashboard as a logged in user
    end

    it 'does not log in with invalid data' do
    # As a Guest
    # When I visit '/login'
    # And I enter invalid information
    # And I click Submit
    # Then I am denied login and prompted to attempt again
    end
  end
end
