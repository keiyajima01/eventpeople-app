FactoryBot.define do
  factory :ticket do
    user
    event
    comment {Faker::Lorem.sentence}
  end
end
