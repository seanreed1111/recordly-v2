require "rails_helper"

RSpec.feature describe "add favorite album" do
  let!(:user) {create(:user)}
  let!(:album){create(:album, user: user)}
  
  before do
    login_as(user)
  end

  scenario "from album show page" do
    visit '/'
    find("#album-#{album.id}").click_link('Show')
    find("#link-to-favorites").click
    visit favorites_index_path
    expect(page).to have_css("#favorite-album-#{album.id}")
  end
end
