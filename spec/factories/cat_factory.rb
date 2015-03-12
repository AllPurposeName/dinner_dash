FactoryGirl.define do
  factory :cat do
    name "cat name"
    description "example description"
    price "20.00"
    status false
    image_path "IDK"
    association :breed, factory: breed: "tabby"
  end
end
