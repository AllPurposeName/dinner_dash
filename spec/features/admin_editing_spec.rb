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
      visit edit_admin_breed_path(breed)

      fill_in "edit name", with: "TEst_name"
      fill_in "edit description", with: "test_description"
      fill_in "edit image_path", with: "test_image_path"
      fill_in "edit retired", with: true
      click_link_or_button("Submit")

      within("#flash-editcomplete") do
        expect(page).to have_content("Test name edited!")
      end
      expect(current_path).to eq("/admin/breeds/test_name/edit")
    end

    it "changes all different types of names" do
      create(:user, role: 1)
      breed = create(:breed, name: "Percifolus gamatron")
      visit edit_admin_breed_path(breed)

      fill_in "edit name", with: "name_test"
      click_link_or_button("Submit")
      within("#flash-editcomplete") do
        expect(page).to have_content("Name test edited!")
      end
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
      create(:user, role: 1)
      cat = create(:cat, name: "garfield")
      visit edit_admin_cat_path(cat)

      fill_in "edit name", with: "TEst_name"
      fill_in "edit description", with: "test_description"
      fill_in "edit price", with: 10000
      fill_in "edit image_path", with: "test_image_path"
      fill_in "edit retired", with: true
      click_link_or_button("Submit")

      within("#flash-editcomplete") do
        expect(page).to have_content("Test name edited!")
      end
      expect(current_path).to eq("/admin/cats/#{cat.id}/edit")
    end

    it "changes all different types of names" do
      create(:user, role: 1)
      cat = create(:cat, name: "Percival")
      visit edit_admin_cat_path(cat)

      fill_in "edit name", with: "Perci the cat"
      click_link_or_button("Submit")
      within("#flash-editcomplete") do
        expect(page).to have_content("Perci the cat edited!")
      end
    end
  end
end
