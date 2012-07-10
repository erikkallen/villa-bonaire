
FactoryGirl.define do
  factory :gallery, :class => Refinery::Galleries::Gallery do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

