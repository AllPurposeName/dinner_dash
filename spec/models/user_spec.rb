require 'rails_helper'

describe "Database exists and" do
  context "has a User that" do
    let(:user) { create(:user) }
    describe "has a username that" do
      it "exists" do
        expect(user.username).to eq("someusername")
      end

      it "is 2 to 32 characters long" do
        short_name_user = build(:user, username: "A")
        long_name = build(:user, username: "123456789asdfghzxcvnmfdsasdfaddds")
        expect(short_name_user).to_not be_valid
        expect(long_name).to_not be_valid
      end
    end

    it "has a password" do
      expect(user.password).to eq("password")
    end

    describe "has a full name that" do
      it "exists" do
        expect(user.full_name).to eq("First Last")
      end

      it "is not blank" do
        user_with_blank_full_name = build(:user, full_name: "")
        expect(user_with_blank_full_name).to_not be_valid
      end
    end

    it "has a role " do
      expect(user.role).to eq("default")
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
