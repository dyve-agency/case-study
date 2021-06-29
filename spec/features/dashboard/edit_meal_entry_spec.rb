require "rails_helper"

feature "Edit meal entry" do
  it "can update a meal entry" do
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

    click_link "Edit"

    fill_in("Fats", with: 10.1)

    click_button "Save"

    expect(page).to have_current_path("/")
    expect(page).to have_content "breakfast has been edited successfully."

    expect(page).to have_table("Meals", with_rows:
      [
        {"Type" => "breakfast", "Fats" => "10.1", "Calories" => "200.1", "Proteins" => "11.2", "Carbohydrates" => "350.01"},
      ])
  end
end
