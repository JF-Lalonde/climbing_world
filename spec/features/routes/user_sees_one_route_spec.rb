require 'rails_helper'

describe "User sees one route" do
  scenario "a user sees a route" do
    location = create(:location)
    pitch = create(:pitch)
    rating = create(:rating)
    route = create(:route, location: location, pitch: pitch, rating: rating)

    visit route_path(route)

    expect(current_path).to eq("/routes/#{route.id}")
    expect(page).to have_content("Route Name")
    expect(page).to have_content("Route Description")
    expect(page).to have_content("5.10b")
    expect(page).to have_content(1)
    expect(page).to have_content("Boulder Canyon")
    expect(page).to have_content("CO")

  end
end
