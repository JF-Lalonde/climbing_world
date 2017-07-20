FactoryGirl.define do
  factory :route do
    route_name "MyString"
    description "OtherString"
    :locations
    :pitches
    :ratings
  end
end
