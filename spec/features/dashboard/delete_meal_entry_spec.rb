require "rails_helper"

feature "Delete meal entry" do
  it "can delete a meal entry" do
    user = create(:user)
    meal = create(:meal, user: user, meal_type: "dinner")

    visit "/login"

    fill_in "Email",    with: "a@b.com"
    fill_in "Password", with: "password"
    check "Remember me"

    click_button "Log in"

    click_link "Destroy"

    expect(page).to have_current_path("/")
    expect(page).to have_content "#{meal.meal_type} has been deleted."
  end
end
