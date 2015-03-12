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
    end

    it 'logs in with valid data' do
    end

    it 'does not log in with invalid data' do
    end
  end
end
