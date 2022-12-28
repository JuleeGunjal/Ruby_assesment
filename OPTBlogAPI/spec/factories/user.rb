# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    mobile_no { Faker::PhoneNumber.cell_phone_in_e164 }
    password { 'Josh@123' }
    gender { 'male' }
  end
end
