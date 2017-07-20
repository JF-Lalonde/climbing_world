require 'rails_helper'

describe Location, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:region) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
  end

  describe "relationships" do
    it { should have_many(:routes) }
  end
end
