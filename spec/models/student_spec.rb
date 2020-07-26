# frozen_string_literal: true

RSpec.describe Student, type: :model do
  subject { create(:student) }

  it { should be_kind_of(Student) }

  describe "name" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
  end

  describe "email" do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }

    it { should allow_value("test@email.com").for(:email) }
    it { should allow_value("also-correct@email").for(:email) }
    it { should_not allow_value("!@#$%^&*(@email").for(:email) }

    it { should validate_uniqueness_of(:email).scoped_to(:group_id).case_insensitive }
  end
end
