require 'rails_helper'
describe 'admin dashboard' do
  it 'when first logged in' do
    # 057
    # As an Admin
    # When I login
    # Then I am redirected to '/admin/inventory'
    # And I see a list of breeds and a list of cats
    User.create(role: 1, username: "Adminguy", password: "adminpass", full_name: "DJ G", email: "admin_example@example.com",)
    visit login_path
    fill_in "session[username]", with: "Adminguy"
    fill_in "session[password]", with: "adminpass"
    click_link_or_button("log in")

    expect(current_path).to eq("/admin/inventory")
    within("#flash-welcomeadmin") do
      expect(page).to have_content("Welcome, Adminguy!")
    end
    expect(page).to have_content("All Cats:")
    expect(page).to have_content("All Breeds:")
  end
  let(:admin) { User.create(role: 1, username: "Adminguy", password: "adminpass", full_name: "DJ G", email: "admin_example@example.com") }
  context 'from the inventory' do
    it 'links to edit breed' do
      # 058
      # As an Admin
      # When I visit '/admin/inventory'
      # And I click on an "edit-breed-#{breed.name}" button
      # Then I am redirected to '/admin/breeds/:id/edit'
      # And I see information for updating that particular breed
      admin
      create(:breed, name: "sabertooth",
                     description: "A long fanged feline for your long suffering appetite!",
                     image_path: "sabertooth_01.jpeg",
                     retired: false)

      visit login_path
      fill_in "session[username]", with: "Adminguy"
      fill_in "session[password]", with: "adminpass"
      click_link_or_button("log in")
      click_link_or_button("edit_breed_sabertooth")

      expect(current_path).to eq("/admin/breeds/1/edit")
      expect(page).to have_content("Sabertooth")
      expect(page).to have_content("Description of Sabertooths:")
      expect(page).to have_content("Image_path of Sabertooths:")
      expect(page).to have_content("Retired status of Sabertooths:")
      expect(page).to have_content("edit")
    end

    it 'links to edit a specific cat' do
      # 062
      # As an Admin
      # When I visit '/admin/inventory'
      # And I click on an "edit-#{cat.name}" button
      # Then I am redirected to '/admin/cats/:id/edit'
      # And I see information for updating that particular cat
      admin
      create(:cat, name: "brody")

      visit login_path
      fill_in "session[username]", with: "Adminguy"
      fill_in "session[password]", with: "adminpass"
      click_link_or_button("log in")

      click_link_or_button("edit_cat_brody")
      expect(current_path).to eq("/admin/cats/1/edit")
      expect(page).to have_content("Brody")
      expect(page).to have_content("Description for Brody:")
      expect(page).to have_content("Price for Brody:")
      expect(page).to have_content("Image_path for Brody:")
      expect(page).to have_content("Retired status for Brody:")
      expect(page).to have_content("edit")
    end
  end
end
