FactoryGirl.define do
  factory :order_cat do
    association :order, factory: :order, id: 1
    association :cat, factory: :cat, id: 1
  end
end
