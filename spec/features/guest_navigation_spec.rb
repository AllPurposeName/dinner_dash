require 'rails_helper'
describe 'Guests can browse for their meal' do

  # before(:each) do
  #    visit root_path
  # end

  context 'on the dashboard' do

    it 'displays a selection of breeds and cats' do
      # 040
      # As a Guest
      # When I visit Dashboard ( '/' )
      # Then I should see a selection(pictures and short descriptions) of breeds under "need a breed"
      # and a selection of cats under "ready right meow"
      create_list :cat, 3
      visit root_path
      expect(page).to have_content("ready right meow")
      expect(page).to have_content("Cat 1")
      expect(page).to have_content("Cat 2")
      expect(page).to have_content("Cat 3")
    end

    it 'links to breeds page' do
      # 041
      # As a Guest
      # When I visit Dashboard ( '/' )
      # And I click on a breed selection
      # And I am redirected to that breed's page
      # Then I should see information on the breed including:
      # name, description, picture, status, price, add to cart

      create(:breed, name: "sabertooth",
                     description: "A long fanged feline for your long suffering appetite!",
                     image_path: "sabertooth_01.jpeg",
                     retired: false)

      visit root_path
      # save_and_open_page
      click_link_or_button("breed_sabertooth")

      expect(current_path).to eq("/breeds/sabertooth")

      within "#status" do
        expect(page).to have_content("Available!")
      end
      within "#breed-single" do
        expect(page).to have_content("Sabertooth")
        expect(page).to have_css("img[src*='sabertooth']")
        expect(page).to have_content("A long fanged feline for your long suffering appetite!")
      end
    end

    it 'links to cats page' do
      # 044
      # As a Guest
      # When I visit Dashboard ( '/' )
      # And I click on a cat selection
      # And I am redirected to the cat's path
      # Then I should see information on the cat including:
      # name, breed, description, price, status, picture, and add to cart
      cat_test = create(:cat, name: "horacio",
                              # breed: "sabertooth",
                              description: "Once the prince of wales' cat, horacio fell on hard times",
                              price: 1000,
                              retired: false,
                              image_path: "sabertooth_01.jpg")

      visit root_path
      click_link_or_button("cat_horacio")

      within "#status" do
        expect(page).to have_content("Available!")
      end

      within "#cat-single" do
        expect(current_path).to eq("/cats/#{cat_test.id}")
        expect(page).to have_content("Horacio")
        expect(page).to have_content("Once the prince of wales' cat, horacio fell on hard times")
        # expect(page).to have_content("sabertooth")
      end
    end
  end



  context 'on the "/breeds" page' do
    it 'shows a proper list of breeds'do
      # 042
      # As a Guest
      # When I visit '/breeds'
      # Then I see a list of breeds each with picture and name

      create_list :breed, 3

      visit root_path
      click_link_or_button("breeds")
      expect(current_path).to eq("/breeds")
      expect(page).to have_content("Breed 1")
      expect(page).to have_content("Breed 2")
      expect(page).to have_content("Breed 3")
    end

    it 'links to individual breeds' do
      # 043
      # As a Guest
      # When I visit '/breeds'
      # And I click on a breed name or picture
      # Then I am linked to the specific breed.

      breeds = create_list :breed, 3
      # binding.pry
      visit breeds_path
      # save_and_open_page
      click_link_or_button(breeds[0].name)
      expect(current_path).to eq("/breeds/#{breeds[0].name.gsub(" ", "%20")}")

      # expect(page).to have_content("Breed 1")

    end
  end

  context 'on the "/cats" page' do
    it 'shows a proper list of cats'do
      # 045
      # As a Guest
      # When I visit '/cats'
      # Then I see a list of all available cats each with picture and name
      create_list :cat, 3
      visit cats_path
      expect(page).to have_content("Cat 4")
      expect(page).to have_content("Cat 5")
      expect(page).to have_content("Cat 6")
    end

    xit 'links to individual cats' do
      # 046
      # As a Guest
      # When I visit '/cats'
      # And I click on a cat name or picture
      # Then I see the cat's page
    end
  end
end
