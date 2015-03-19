require "rails_helper"

RSpec.describe Cat, type: :model do
  context "must" do

    context "have a name" do
      it "exists" do
        expect(build(:cat, name: "Snowball")).to be_valid
      end

      it "must not be blank" do
        expect(build(:cat, name: "")).to_not be_valid
      end

      it "is 2 to 32 characters long" do
        short_name = build(:cat, name: "A")
        long_name = build(:cat, name: "123456789asdfghzxcvnmfdsasdfaddds")
        expect(short_name).to_not be_valid
        expect(long_name).to_not be_valid
      end

      it "must be unique" do
        cat1 = create(:cat, name: "Abe")
        cat2 = build(:cat, name: "Abe")
        expect(cat1).to be_valid
        expect(cat2).to_not be_valid
      end
    end


    context "have a description" do
      it "exists" do
        expect(build(:cat, description: "super awesome cat")).to be_valid
      end

      it "that must not be blank" do
        expect(build(:cat, description: "")).to_not be_valid
      end
    end


    context "have a valid price" do
      it "exists" do
        expect(build(:cat, price: "1000")).to be_valid
      end

      it "that must not be blank" do
        expect(build(:cat, price: "")).to_not be_valid
      end
    end


    context "have an image path" do
      it "exists" do
        expect(build(:cat, image_path: "sabertooth_01.jpeg")).to be_valid
      end

      # it "is default if " do
      #   cat = Cat.create(name: "cat")
      #   expect(cat.image_path).to eq("cat.jpg")
      # end
    end


    context "belongs to a breed" do
      it "exists" do
        breed = create(:breed, name: "sabertooth")
        feline = breed.cats.create(name: "SnowballIV",
                                   price: 1000,
                                   retired: false,
                                   image_path: "image.jpg",
                                   description: "some description")
        expect(feline.breeds.first.name).to eq("sabertooth")
      end
    end


  end
end
