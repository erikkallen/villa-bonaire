
FactoryGirl.define do
  factory :reservation, :class => Refinery::Reservations::Reservation do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

