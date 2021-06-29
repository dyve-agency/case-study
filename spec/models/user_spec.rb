require "rails_helper"

describe User do
  describe "validations" do
    subject { build(:user) }

    it { should validate_presence_of(:email) }
  end

  describe "associations" do
    subject { build(:user) }

    it { should have_many(:meals) }
  end
end
