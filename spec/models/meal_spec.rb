require "rails_helper"

include ActiveSupport::Testing::TimeHelpers

describe Meal do
  describe "validations" do
    subject { build(:meal) }

    it { should validate_presence_of(:meal_type) }
    it { should validate_presence_of(:fats) }
    it { should validate_presence_of(:proteins) }
    it { should validate_presence_of(:calories) }
    it { should validate_presence_of(:carbohydrates) }
    it { should validate_presence_of(:user) }

    it do
      should define_enum_for(:meal_type)
        .with_values(
          breakfast: 'breakfast',
          brunch: 'brunch',
          lunch: 'lunch',
          dinner: 'dinner'
        ).backed_by_column_of_type(:enum)
    end

    context "unique meal types per day" do
      describe "when the same meal exists on the same day" do
        it "is not valid" do
          create(:meal, meal_type: "breakfast")
          meal_b = build(:meal, meal_type: "breakfast")

          expect(meal_b).to_not be_valid
          expect(meal_b.errors[:meal_type].first).to eql("breakfast already logged for today.")
        end
      end

      describe "when creating a non existing meal" do
        it "is valid" do
          create(:meal, meal_type: "breakfast")
          meal_b = build(:meal, meal_type: "lunch")

          expect(meal_b).to be_valid
        end
      end

      describe "when creating the same meal on different days" do
        it "is valid" do

          travel_to 1.day.ago do
            create(:meal, meal_type: "breakfast")
          end
          meal_b = build(:meal, meal_type: "breakfast")

          expect(meal_b).to be_valid
        end
      end
    end
  end

  describe 'associations' do
    subject { build(:meal) }

    it { should belong_to(:user) }
  end
end
