require 'rails_helper'

RSpec.describe Quality, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:star_value) }
  end

  describe "relationships" do
    it { should have_many(:routesqualities) }
    it { should have_many(:routes) }
  end
end
