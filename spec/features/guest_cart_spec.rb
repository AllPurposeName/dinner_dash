require "rails_helper"
describe "guest can use a cart" do
  it "redirects through the continue button" do
    # 048
    # As a Guest
    # When I visit "/cart"
    # And I click the "continue" button
    # Then I am redirected to the previous page I was on
    # and if I weren"t on a valid page(dashboard, breeds, cats)
    # Then I am redirected to the dashboard
    kitty = create(:cat, name: "kitty")

    visit "/cats/#{kitty.id}"
    click_link_or_button("add to cart")
    expect(current_path).to eq(cart_path)
    click_link_or_button("continue")
    expect(current_path).to eq("/breeds")
  end

  it "displays multiple cats" do
    kitty = create(:cat, name: "kitty")
    visit "/cats/#{kitty.id}"
    click_link_or_button("add to cart")
    visit "/cats/#{kitty.id}"
    click_link_or_button("add to cart")
    kitty.price = (kitty.price * 2)
    expect(page).to have_content(kitty.monify)
  end


  xit "stops Guest from checking out without logging in" do
    # 050
    # As a Guest
    # When I visit "/cart"
    # And I click the "checkout" button
    # Then I am prompted to login at the login page
    # context "on the "/cart"" do
    bruno = create(:cat, name: "Bruno")
    visit "/cats/#{bruno.id}"
    click_link_or_button("add to cart")
    click_link_or_button("checkout")
    expect(current_path).to eq(login_path)
    expect(page).to have_content("log in first")
  end

  context "has a button to" do
    it "increment by one" do
      bruno = create(:cat, name: "Bruno")
      visit "/cats/#{bruno.id}"
      click_link_or_button("add to cart")
      expect(page).to have_content(1)
      click_link_or_button("plus-#{bruno.id}")
      expect(page).to have_content(2)
    end
    it "decrement by one" do
      bronson = create(:cat, name: "Bronson")
      visit "/cats/#{bronson.id}"
      click_link_or_button("add to cart")
      expect(page).to have_content(1)
      click_link_or_button("plus-#{bronson.id}")
      expect(page).to have_content(2)
      click_link_or_button("minus-#{bronson.id}")
      expect(page).to have_content(1)
    end
    it "destroys a cat" do
      kitty = create(:cat, name: "kitty")
      visit "/cats/#{kitty.id}"
      click_link_or_button("add to cart")
      click_link_or_button("plus-#{kitty.id}")
      click_link_or_button("remove-#{kitty.id}")
      expect(page).not_to have_content("kitty")
    end

  end

  xit "directs Guest to their orders after they log in from cart#checkout" do
    # 052
    # As a Guest
    # When I am prompted to login from the "checkout" button
    # And I login validly
    # Then I see my order page with the cart"s items added to the list of orders
  end
  xit "stops Guest from viewing their order history without logging in" do
    # 049
    # As a Guest
    # When I visit "/cart"
    # And I click the "order history" button
    # Then I am prompted to login at the login page
  end
  xit "directs Guest to their orders after they log in from cart#order history" do
    # 051
    # As a Guest
    # When I am prompted to login from the "order history" button
    # And I login validly
    # Then I see my order page with all my past orders
  end
end
