# frozen_string_literal: true

FactoryBot.define do
  factory :category do

    transient do
      doctors_count { 2 }
    end

    trait :with_doctors do
      doctors { build_list(:doctor, doctors_count) }
    end
  end
end
