require 'ffaker'

FactoryGirl.define do
  factory :question do
    content { FFaker::Name.name }
    answer { FFaker::Name.name }
  
    factory :invalid_question do
      content nil
      answer nil
    end
  end
end