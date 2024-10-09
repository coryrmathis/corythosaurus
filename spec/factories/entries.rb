FactoryBot.define do
  factory :entry do
    body { Faker::Lorem.paragraphs(number: rand(2..5), supplemental: true).join("\n") }
  end
end
