FactoryBot.define do
  factory :user do
    name { "товарищ_#{rand(10)}" }

    sequence(:email) { |t| "ya_#{t}@test.com" }
    after(:build) { |u| u.password_confirmation = u.password = '123456' }
  end
end
