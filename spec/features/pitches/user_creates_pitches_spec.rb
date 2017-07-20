require 'rails_helper'

feature "User creates a pitch" do
  scenario "a user can create a new pitch" do
    visit new_pitch_path

    fill_in "pitch[number]", with: 2
    click_button "Create"

    expect(current_path).to eq("/pitches/#{Pitch.last.id}")
    expect(page).to have_content("Created!")
    expect(page).to have_content(2)
    expect(Pitch.count).to eq(1)
  end
end
