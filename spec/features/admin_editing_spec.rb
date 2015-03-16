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
      visit edit_admin_breed(breed)

      fill_in "edit-name", with: "test-name"
      fill_in "edit-description", with: "test-description"
      fill_in "edit-image_path", with: "test-image_path"
      fill_in "edit-price", with: "test-description"
      fill_in "edit-retired", with: "test-retired"
      click_link_or_button("Submit")

      within("#flash-editcomplete") do
        expect(page).to have_content("#{breed.name.capitalize} edited!")
      end
      expect(current_path).to eq("/breeds/#{breed.to_param.name}")
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
