require 'rails_helper'

RSpec.feature "Signed-in users can sign out" do
  let!(:user) {create(:user)}

  before do
    login_as(user)
  end

  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content "sign in or sign up before continuing"
  end

end