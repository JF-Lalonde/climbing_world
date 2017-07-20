require 'rails_helper'

feature "User creates a route" do
  scenario "by selecting all other values from drop down menu" do
    location = create(:location)
    pitch = create(:pitch)
    rating = create(:rating)
    visit new_route_path

    fill_in "route[route_name]", with: "Bastille"
    fill_in "route[description]", with: "Great climb!"

    page.find(".first").click
    select "Boulder Canyon"

    page.find(".second").click
    select "Boulder"

    page.find(".third").click
    select "CO"

    page.find("#route_pitch_id").click
    select 1

    page.find("#route_rating_id").click
    select "5.10b"

    expect(page).to have_link "Create New Location"
    expect(page).to have_link "Create New Pitches"
    expect(page).to have_link "Create New Rating"

    click_button "Create"
    expect(current_path).to eq("/routes/#{Route.last.id}")
    expect(page).to have_content("Bastille")
    expect(page).to have_content("Great climb!")
    expect(page).to have_content("Boulder Canyon")
    expect(page).to have_content(1)
    expect(page).to have_content("5.10b")
    expect(Route.count).to eq(1)
  end
end
