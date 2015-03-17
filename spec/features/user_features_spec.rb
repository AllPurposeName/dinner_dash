require "rails_helper"
describe "authenticated user" do
  xit "is not prompted to login when visiting '/user/id/orders'" do
  end

  it "gains items in cart when clicking the 'add to cart' button" do
    cat = create(:cat)
    user = User.create(role: 0, username: "guy", password: "pass", full_name: "DJ G", email: "example@example.com",)
    visit login_path
    fill_in "session[username]", with: "guy"
    fill_in "session[password]", with: "pass"
    click_link_or_button("log in")
    visit cat_path(cat.id)
    click_link_or_button("add to cart")
    expect(page).to have_content(cat.price)
    expect(page).to have_content("cart")
  end

  xit "still restricts user from viewing admin or missing templates" do
  end

  it "is able to checkout their cart" do
    cat = create(:cat)
    user = User.create(role: 0, username: "guy", password: "pass", full_name: "DJ G", email: "example@example.com",)
    visit login_path
    fill_in "session[username]", with: "guy"
    fill_in "session[password]", with: "pass"
    click_link_or_button("log in")
    # create cat
    # after user is created, add cat to cart
    # click checkout
    # expect user's order to have cat in it

    visit cat_path(cat.id)
    click_link_or_button("add to cart")
    click_link_or_button("checkout")
    expect(user.orders.count).to eq(1)
    expect(user.orders.first.cats.count).to eq(1)

  end

  it "Can view their orders" do 
    cat = create(:cat)
    user = User.create(role: 0, username: "guy", password: "pass", full_name: "DJ G", email: "example@example.com",)
    visit login_path
    fill_in "session[username]", with: "guy"
    fill_in "session[password]", with: "pass"
    click_link_or_button("log in")
    order = user.orders.create(status: 0)
    order.order_cats.create(cat_id: cat.id, quantity: 2)
    visit orders_path
    expect(page).to have_content(cat.name)
  end
end
