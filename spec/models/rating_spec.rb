require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:number) }
  end

  describe "relationships" do
    it { should have_many(:routes) }
  end
end
