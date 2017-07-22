require 'rails_helper'

RSpec.describe Routesquality, type: :model do
  describe "relationships" do
    it {should belong_to(:route) }
    it {should belong_to(:quality) }
  end
end
