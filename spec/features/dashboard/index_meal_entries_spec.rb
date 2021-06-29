require "rails_helper"

feature "Dashboard" do
  it "shows information about user's meals" do
    user = create(:user)
    create(
      :meal,
      user: user,
      meal_type: "breakfast",
      fats: 10.1,
      calories: 200.1,
      proteins: 11.2,
      carbohydrates: 350.01,
    )
    create(
      :meal,
      user: user,
      meal_type: "dinner",
      fats: 2,
      calories: 20.1,
      proteins: 5.5,
      carbohydrates: 50.01,
    )

    visit("/")

    fill_in "Email",    with: "a@b.com"
    fill_in "Password", with: "password"

    click_button "Log in"

    expect(page).to have_table("Meals", with_rows:
      [
        {"Type" => "breakfast", "Fats" => "10.1", "Calories" => "200.1", "Proteins" => "11.2", "Carbohydrates" => "350.01"},
        {"Type" => "dinner",    "Fats" => "2",    "Calories" => "20.1",  "Proteins" => "5.5",  "Carbohydrates" => "50.01"},
      ])
  end
end
