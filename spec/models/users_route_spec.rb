require 'rails_helper'

RSpec.describe UsersRoute, type: :model do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:route) }
  end
end
