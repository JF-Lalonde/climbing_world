require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:route) }
  end
end
