FactoryGirl.define do

  factory :cat do
    sequence(:name) { |n| "Cat #{n}"}
    price 3000
    retired false
    image_path "MyText"
    description "MyText"
  end

end

    # before(:create) do |cat|
    #   cat.breeds << create(:breed)
    # end
