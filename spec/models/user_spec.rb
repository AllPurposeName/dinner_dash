require 'rails_helper'
 describe "Database exists and" do

   let(:example_user) { create(:user) }
   context "has a User that" do
     it "has a username" do
       expect(example_user.username).to eq("someusername")
     end

     it "has a password" do
       expect(example_user.password).to eq("password")
     end

     it "has a full name" do
       expect(example_user.full_name).to eq("First Last")
     end

     it "has a role " do
       expect(example_user.role).to eq("default")
     end

     it "has an email" do
       expect(example_user.email).to eq("example@example.com")
     end

     it "has orders" do
       expect(example_user.orders).to eq([])
     end
   end
 end
