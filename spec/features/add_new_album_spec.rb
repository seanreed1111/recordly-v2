require "rails_helper"

RSpec.feature "add new album" do
  let(:user) {create(:user)}
  
  before do
    login_as(user)
  end

  scenario "from albums#index" do
    visit '/albums'
    click_link 'Add New Album'
    fill_in "Name", with: "My Awesome Album Name"
    click_button "Save"

    expect(page).to have_content "My Awesome Album Name"
  end

  scenario "from menu on home page" do
    #from dropdown menu, click Your Albums, then select_option "Add New album"
    click_link 'Add New Album'
    fill_in "Name", with: "Purple Rain"
    click_button "Save"

    expect(page).to have_content "Purple Rain"
  end



end