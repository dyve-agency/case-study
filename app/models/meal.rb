class Meal < ApplicationRecord
  belongs_to :user

  enum meal_type: { breakfast: 'breakfast', brunch: 'brunch', lunch: 'lunch', dinner: 'dinner' }

  validates :meal_type,     presence: true
  validates :fats,          presence: true
  validates :carbohydrates, presence: true
  validates :calories,      presence: true
  validates :proteins,      presence: true
  validates :user,          presence: true
  validate  :unique_meal_type_per_day

  private

  def unique_meal_type_per_day
    existing_meal = Meal.find_by(
      meal_type: meal_type,
      created_at: Time.now.beginning_of_day..Time.now.end_of_day
    )

    return if self == existing_meal

    if existing_meal
      errors.add(:meal_type, "#{meal_type} already logged for today.")
    end
  end
end
