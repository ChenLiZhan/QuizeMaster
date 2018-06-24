FactoryBot.define do
  factory :question do
    content { Faker::Lorem.word }
    answer { Faker::Lorem.word }
  end
end