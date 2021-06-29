require "rails_helper"

feature "Sign up user" do
  it "signs up a new user" do
    visit "/register"

    fill_in "Email",                 with: "a@b.com"
    fill_in "Password",              with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "a@b.com"
    expect(page).to have_current_path("/")
  end
end
