# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    phone { FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[ -]/, '') }
    password { FFaker::Internet.password.truncate(10) }
    password_confirmation { password }
    name { FFaker::Name.unique.name }
  end
end
