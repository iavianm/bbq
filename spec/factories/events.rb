FactoryBot.define do
  factory :event do
    association :user

    title { |n| n.rand(10).to_s }
    description { |n| n.rand(10).to_s }
    address { |n| n.rand(10).to_s }
    datetime { Time.now }
  end
end
