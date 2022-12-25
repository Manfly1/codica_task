# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    user
    doctor

    trait :closed do
      recommendation { FFaker::Lorem.paragraph }
      closed { true }
    end
  end
end
