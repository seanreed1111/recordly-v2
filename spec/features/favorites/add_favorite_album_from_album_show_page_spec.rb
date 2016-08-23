require "rails_helper"

RSpec.feature describe "add favorite album" do
  let!(:user) {create(:user)}
  let!(:album){create(:album, user: user)}
  
  before do
    login_as(user)
  end

  scenario "from album show page" do
    visit '/'
    expect(page).to have_content("Listing albums")

    expect(album).to be_valid
    expect(album.name).to eq("ThisisMyAlbum")

    find("#album-#{album.id}").click_link('Show')
    find("#link-to-favorites").click
    expect(page).to have_css("#favorite-album-#{album.id}")
  end
end

