require "rails_helper"
describe "Guest on the login page", type: :feature do


  context "there is as skip button" do
    it "login is not necessary" do
      # 047
      # As a Guest
      # When I visit "/login"
      # And I don"t wish to login
      # And I click the "not now" button
      # Then I should see the dashboard
      visit "/login"
      click_link_or_button("not now")
      expect(current_path).to eq("/")
    end
  end
  context "there is a log in button" do
    it "logs in with valid data" do
      #   As a Guest
      #   when I visit "/login"
      #   And I enter valid information
      #   And I click submit
      #   Then I should be redirected to the dashboard as a logged in user
      guests_identity = create(:user, username: "DJ", password: "pw")
      visit "/login"
      fill_in "session[username]", with: "DJ"
      fill_in "session[password]", with: "pw"
      click_link_or_button("log in")

      expect(current_path).to eq("/")
      # expect(current_user).to eq(guests_identity.name)
    end

    it "does not log in with invalid data" do
      # As a Guest
      # When I visit "/login"
      # And I enter invalid information
      # And I click Submit
      # Then I am denied login and prompted to attempt again
      guests_identity = create(:user, username: "Felix", password: "thecat")

      visit "/login"
      fill_in "session[username]", with: "Felix"
      fill_in "session[password]", with: "thecatinthehat"
      click_link_or_button("log in")

      within("#flash-tryagain") do
        expect(page).to have_content("Whoops, try again")
      expect(current_path).to eq("/login")
    end
    end
  end
end
