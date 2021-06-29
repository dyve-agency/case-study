require "rails_helper"

feature "Log meal entry" do
  it "logs a new meal entry with its nutrition in the system" do
    create(:user)

    visit "/login"

    fill_in "Email",    with: "a@b.com"
    fill_in "Password", with: "password"
    check "Remember me"

    click_button "Log in"

    click_link "Add entry"

    select("breakfast", from: "Meal type")
    fill_in("Fats", with: 10.1)
    fill_in("Calories", with: 200.01)
    fill_in("Proteins", with: 20.14)
    fill_in("Carbohydrates", with: 120.14)

    click_button "Save"

    expect(page).to have_current_path("/")
    expect(page).to have_content "New meal entry was added."
  end

  it "shows a validation error if the meal type has been already logged in the system" do
    user = create(:user)
    create(
      :meal,
      user: user,
      meal_type: "breakfast",
      fats: 1.1,
      calories: 200.1,
      proteins: 11.2,
      carbohydrates: 350.01,
    )

    visit "/login"

    fill_in "Email",    with: "a@b.com"
    fill_in "Password", with: "password"

    click_button "Log in"

    click_link "Add entry"

    select("breakfast", from: "Meal type")
    fill_in("Fats", with: 1.1)
    fill_in("Calories", with: 200.01)
    fill_in("Proteins", with: 20.14)
    fill_in("Carbohydrates", with: 120.14)

    click_button "Save"

    expect(page).to have_current_path("/meals")
    expect(page).to have_content "Meal type breakfast already logged for today."
  end
end
