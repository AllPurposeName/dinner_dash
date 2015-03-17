require "rails_helper"
describe "admin editing mode" do
  context "for breeds" do
    it "allows admin to change all fields" do
      # 059
      # As an Admin
      # When I visit "/admin/breeds/:id/edit"
      # And I fill in the name field
      # And I fill in the description field
      # And I click the "save" button
      # Then I am redirected to that breed"s page
      # And I see the edited breed with it"s new name and description
      create(:user, role: 1)
      breed = create(:breed)
      visit edit_admin_breed_path(breed.to_param)

      fill_in "edit name", with: "test_name"
      fill_in "edit description", with: "test_description"
      fill_in "edit image_path", with: "test_image_path"
      fill_in "edit retired", with: true
      click_link_or_button("Submit")

      within("#flash-editcomplete") do
        expect(page).to have_content("Test name edited!")
      end
      expect(current_path).to eq("/admin/breeds/test_name/edit")
    end
    it "allows admin to change image" do
      # 060
      # As an Admin
      # When I visit "/admin/breeds/:id/edit"
      # And I fill in the image field
      # And I click the "save" button
      # Then I am redirected to that breed"s page
      # And I see the edited breed with it"s new image in the carosel
    end

    it "allows admin to change sold out status" do
      # 061
      # As an Admin
      # When I visit "/admin/breeds/:id/edit"
      # And I click the retire button
      # Then I am redirected to the breed"s page
      # And I see the retried breed with it"s status set to "sold out"
    end
  end
  context "for individual cats" do
    it "allows admin to change name and description" do
      # 063
      # As an Admin
      # When I visit "/admin/cats/:id/edit"
      # And I fill in the name field
      # And I fill in the description field
      # And I click the "save" button
      # Then I am redirected to that cat"s page
      # And I see the edited cat with it"s new name and description
      # fill_in "edit price", with: "test-description"
    end
    it "allows admin to change image" do
      # 064
      # As an Admin
      # When I visit "/admin/cats/:id/edit"
      # And I fill in the image field
      # And I click the "save" button
      # Then I am redirected to that cat"s page
      # And I see the edited cat with it"s new image
    end
    it "allows admin to change sold out status" do
      # 065
      # As an Admin
      # When I visit "/admin/cats/:id/edit"
      # And I click the retire button
      # Then I am redirected to the cat"s page
      # And I see the retried cat with it"s status set to "sold out"
    end
  end
end
