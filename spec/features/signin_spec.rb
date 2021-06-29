require "rails_helper"

feature "Sign in user" do
  it "signs in a user" do
    create(:user)

    visit "/login"

    fill_in "Email",    with: "a@b.com"
    fill_in "Password", with: "password"
    check "Remember me"

    click_button "Log in"

    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "a@b.com"
    expect(page).to have_current_path("/")
  end
end
