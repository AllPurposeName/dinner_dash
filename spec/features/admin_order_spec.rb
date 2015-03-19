require "rails_helper"
describe "admin orders" do
  it "displays a list of orders and filter buttons" do
#    Order.create(user_id: 1, status: 0)
#    visit "/admin/orders"
#    within("table tr td") do
#      expect(page).to have_content("1")
#    end
  end
  context "from '/admin/orders'" do
    it "allows admin to change status to 'paid'" do
      # 067
      # As an Admin
      # When I visit "/admin/orders"
      # And I see an order which is ready
      # And I click on a "paid" button
      # Then I stay on the same page
      # And I see the order status change to "paid"
    end

    it "allows admin to change status to 'completed'" do
      # 068
      # As an Admin
      # When I visit "/admin/orders"
      # And I see an order which is paid
      # And I click on a "completed" button
      # Then I stay on the same page
      # And I see the order status change to "completed"
    end
    it "allows admin to change status to 'cancelled'" do
      # 069
      # As an Admin
      # When I visit "/admin/orders"
      # And I see an order which is either ready, paid, or completed
      # And I click on a "cancelled" button
      # Then I stay on the same page
      # And I see the order status change to "cancelled"
    end
  end
  context "when visiting a particular order" do
    it "it displays a lot of information" do
      # 070
      # As an Admin
      # When I visit "/admin/orders"
      # And I click on an order"s name
      # Then I am redirected to a "/admin/orders/:id"
      # And I see a table describing that order
      # And buttons to edit that order"s status (ready, paid, completed, cancelled)
    end
    it "allows admin to change status with filter buttons" do
      # 071
      # As an Admin
      # When I visit "/admin/orders/:id"
      # The buttons should function as they do in "admin/orders"
      # Except they link me to the coordinating "/users/:id/orders"
    end
  end
end
