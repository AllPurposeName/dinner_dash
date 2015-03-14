require 'rails_helper'

describe "Database exists and" do
  context "has a User that" do
    let(:user) { create(:user) }
    it "has a username" do
      expect(user.username).to eq("someusername")
    end

    it "has a password" do
      expect(user.password).to eq("password")
    end

    it "has a full name" do
      expect(user.full_name).to eq("First Last")
    end

    it "has a role " do
      expect(user.role).to eq(0)
    end

    describe "has an email" do
      it "exists" do
        expect(user.email).to eq("example@example.com")
      end

      it "is unique" do
        user
        duplicate_email_user = build(:user)
        expect(duplicate_email_user).to_not be_valid
      end

      it "is plausible" do
        expect(build(:user, email: "Poop")).to_not be_valid
      end
    end

    it "has orders" do
      expect(user.orders).to eq([])
    end
  end
end

