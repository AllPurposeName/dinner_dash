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
  context 'from the inventory' do
    it 'links to edit breed' do
      # 058
      # As an Admin
      # When I visit '/admin/inventory'
      # And I click on an "edit-#{breed.name}" button
      # Then I am redirected to '/admin/breeds/:id/edit'
      # And I see information for updating that particular breed
    end

    it 'links to edit a specific cat' do
      # 062
      # As an Admin
      # When I visit '/admin/inventory'
      # And I click on an "edit-#{cat.name}" button
      # Then I am redirected to '/admin/cats/:id/edit'
      # And I see information for updating that particular cat
    end
  end
end
