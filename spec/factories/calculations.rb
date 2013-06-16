# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calculation do
    weight 20
    dehydration 5
    factory :hourly do
      method "hourly"
    end
    factory :daily do
      method "daily"
    end
  end
end
