require 'rails_helper'

RSpec.feature "Ransack Search function works" do
  let!(:user) {create(:user)}

  before do
    login_as(user)
  end

  scenario "for albums " do
    visit "/"
    album1 = create(:album, user: user, name: "Mxyzptlk")
    album2 = create(:album, user: user)
    fill_in "search", with: "Mxy"

    click_button "Search"

    expect(page).to have_content("Mxyzptlk")
    expect(page).not_to have_content(album2.name)
  end

  scenario "for artists " do
    visit "/"
    artist1 = create(:artist, name: "ZABCD")
    artist2 = create(:artist)
    fill_in "search", with: "ABC"

    click_button "Search"

    expect(page).to have_content("ZABCD")
    expect(page).not_to have_content(artist2.name)
  end

    scenario "for songs " do
    visit "/"
    song1 = create(:song, name: "QWERTY")
    song2 = create(:song)
    album = create(:album, name: "RTYUIOP")
    fill_in "search", with: "RTY"

    click_button "Search"

    expect(page).to have_content("QWERTY")
    expect(page).to have_content("RTYUIOP")
    expect(page).not_to have_content(song2.name)
  end


end