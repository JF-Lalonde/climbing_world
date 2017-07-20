require 'rails_helper'

describe "User edits an existing route" do
  scenario "a user can edit a route" do
    location = create(:location)
    pitch = create(:pitch)
    rating = create(:rating)
    route = create(:route, description: "Amazing Route", location: location, pitch: pitch, rating: rating)

    visit edit_route_path(route)

    fill_in "route[route_name]", with: "Edited Route"
    fill_in "route[description]", with: "Edited Description"
    click_button "Update"

    expect(current_path).to eq("/routes/#{Route.last.id}")
    expect(page).to have_content("Edited Route")
    expect(page).to_not have_content("Route Name")
    expect(page).to have_content("Edited Description")
    expect(page).to_not have_content("Amazing Route")
  end
end
