require 'rails_helper'

RSpec.describe Cat, type: :model do
  context "must" do
    it "have a title" do
      expect(build(:cat, name: "")).to_not be_valid
    end
  end
end
