FactoryBot.define do
  factory :variation do
    kind { "PDF" }
    trait :with_book do
      book { association :book }
    end
  end
end
