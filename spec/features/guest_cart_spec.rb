require 'rails_helper'
describe 'guest can use a cart' do
  context 'adding to the cart' do
    it 'adds cats to the cart' do
    end
  end


  it 'redirects through the continue button' do
    # 048
    # As a Guest
    # When I visit '/cart'
    # And I click the "continue" button
    # Then I am redirected to the previous page I was on
    # and if I weren't on a valid page(dashboard, breeds, cats)
    # Then I am redirected to the dashboard
  end
  it 'stops Guest from checking out without logging in' do
    # 050
    # As a Guest
    # When I visit '/cart'
    # And I click the "checkout" button
    # Then I am prompted to login at the login page
    # context 'on the "/cart"' do
  end
  it 'directs Guest to their orders after they log in from cart#checkout' do
    # 052
    # As a Guest
    # When I am prompted to login from the "checkout" button
    # And I login validly
    # Then I see my order page with the cart's items added to the list of orders
  end
  it 'stops Guest from viewing their order history without logging in' do
    # 049
    # As a Guest
    # When I visit '/cart'
    # And I click the "order history" button
    # Then I am prompted to login at the login page
  end
  it 'directs Guest to their orders after they log in from cart#order history' do
    # 051
    # As a Guest
    # When I am prompted to login from the "order history" button
    # And I login validly
    # Then I see my order page with all my past orders
  end
end
end
