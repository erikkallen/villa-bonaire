
FactoryGirl.define do
  factory :guestbook, :class => Refinery::Guestbooks::Guestbook do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

