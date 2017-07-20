require 'rails_helper'

describe Route, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:route_name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "relationships" do
    it { should belong_to(:location) }
    it { should belong_to(:pitch) }
    it { should belong_to(:rating) }
  end
end
