FactoryGirl.define do
  factory :route do
    route_name "Route Name"
    description "Route Description"
    :locations
    :pitches
    :ratings
  end
end
