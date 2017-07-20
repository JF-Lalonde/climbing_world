require 'rails_helper'

feature "User creates a route" do
  scenario "by selecting all other values from drop down menu" do
    visit new_route_path

    fill_in "route[route_name]", with: "Bastille"
    click_button "Create"

    expect(current_path).to eq(routes_path)
    expect(page).to have_content("Bastille")
    expect(Route.count).to eq(1)
  end
end
