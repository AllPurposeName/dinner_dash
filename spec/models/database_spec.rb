require 'spec_helper'

describe "Database exists and" do

  context "has a User that" do

    let(:example_user) { create(:user) }

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
      expect(example_user.role).to eq(0)
    end

    it "has an email" do 
      expect(example_user.email).to eq("example@example.com")
    end

    it "has orders" do
      expect(example_user.orders).to eq([])
    end
  end

  context "has Orders that" do

    let(:example_order) { create(:order) }

    it "has a timestamp" do
      expect(example_order.created_at).to eq("created at")
      expect(example_order.updated_at).to eq("updated at")
    end

    it "belongs to a user" do
      expect(example_order.user).to eq(User.find(example_order.user_id))
    end

    it "belongs to a status" do
      expect(example_order.status).to eq(Status.find(example_order.status_id)
    end
  end

  context "has Statuses that" do
    it "has a name" do 
      status = create(:status)
      expect(status.name).to eq("Paid")
    end
  end

  context "has OrderItems that" do

    let(:example_order_item) { create(:order_item) }

    it "belongs to an Order" do
      expect(example_order_item.order).to eq(Order.find(example_order_item.order_id)
    end

    it "belongs to an Item" do
      expect(example_order_item.item).to eq(Item.find(example_order_item.item_id)
    end
  end

  context "has Items that" do

    let(:example_item) { create(:item) }
    let(:retired_item) { create(:retired_item) }

    it "has a name" do
      item = build(:item, title: "")
      expect(item).to_not be_valid
      expect(example_item.name).to eq("item name")
    end

    it "has a description" do
      item = build(:item, description: "")
      expect(item).to_not be_valid
      expect(example_item.description).to eq("example description")
    end

    it "has a price" do
      expect(example_item.price).to eq("20.00")
    end

    it "is retired or not" do
      expect(example_item.retired?).to eq(false)
      expect(retired_item.retired?).to eq(true)
    end

    it "has an image_path" do
      expect(example_item.item_path).to eq("IDK")
    end

    it "belongs to at least one breed" do
      example_item.breeds.count.should > 0
    end
  end

  context "has Item breeds that" do

    let(:an_item_breed) { create(:item_breed) }

    it "belongs to an Item" do
      expect(an_item_breed.item).to eq(Item.find(an_item_breed.item_id)
    end

    it "belongs to a breed" do
      expect(an_item_breed.breed).to eq(breed.find(an_item_breed.item_id)
    end
  end

  context "has breeds" do

    let(:a_breed) { create(:breed)}
    let(:retired_breed) { create(:retired_breed) }

    it "has a name" do
      expect(a_breed.name).to eq("Tabby")
    end

    it "has an image_path" do
      expect(a_breed.image_path).to eq("IDK")
    end

    it "is retired or not" do
      expect(a_breed.retired?).to eq(false)
      expect(retired_breed.retired?).to eq(true)
    end
  end
end
