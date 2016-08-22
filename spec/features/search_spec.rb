require 'rails_helper'

RSpec.feature "Search function works" do
  let!(:user) {FactoryGirl.create(:user)}

  before do
    login_as(user)
  end


  scenario "when using default search results" do
    visit "/"
    fill_in "search", with: "blah"

    click_button "Search"

    expect(page).to have_content("This is the Default")
  end

  scenario "when using Ransack to search " do
    visit "/"
    album1 = create(:album, user: user, name: "Mxyzptlk")
    album2 = create(:album, user: user)
    fill_in "search", with: "Mxyzptlk"

    click_button "Search"

    expect(page).to have_content("Mxyzptlk")
    expect(page).not_to have_content(album2.name)
  end


end