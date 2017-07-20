require 'rails_helper'

describe "User sees all routes" do
  scenario "a user sees all the routes" do

    location = create(:location)
    pitch = create(:pitch)
    rating = create(:rating)
    route_one = create(:route, location: location, pitch: pitch, rating: rating)
    route_two = create(:route, location: location, pitch: pitch, rating: rating)

    visit routes_path

    expect(page).to have_content(route_one.location.region)
    expect(page).to have_content(route_one.location.city)
    expect(page).to have_content(route_one.pitch.number)
    expect(page).to have_content(route_one.rating.number)
    expect(page).to have_content(route_one.route_name)
    expect(page).to have_content(route_one.description)
    expect(page).to have_content(route_two.location.region)
    expect(page).to have_content(route_two.location.city)
    expect(page).to have_content(route_two.pitch.number)
    expect(page).to have_content(route_two.rating.number)
    expect(page).to have_content(route_two.route_name)
    expect(page).to have_content(route_two.description)
    expect(Route.count).to eq(2)
  end

end
