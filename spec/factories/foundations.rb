FactoryGirl.define do
  factory :foundation do
    country_alpha2 "US"
    local_currency "USD"
    postal_code "11206"
    min_starting_funds 1000
    min_participants 100
    activation_deadline Date.today + 30.days
  end
end
