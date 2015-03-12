FactoryGirl.define do
  factory :order do
    created_at "created_at"
    updated_at "updated_at"
    association :status, factory: :status, name: "Paid"
    association :user, factory: :user, id: 1
  end
end