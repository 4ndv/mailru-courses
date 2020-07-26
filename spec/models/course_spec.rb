# frozen_string_literal: true

RSpec.describe Course, type: :model do
  subject { create(:course) }

  it { should be_kind_of(Course) }

  describe "title" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(255) }
  end

  describe "closest_starting_group" do
    it "should return group with the lowest start_at" do
      start_at = [1.day.ago, 30.days.after, 2.days.after, 2.days.ago]

      start_at.each { |s| create(:group, course: subject, start_at: s) }

      subject.reload

      expect(subject.closest_starting_group.start_at).to eq(start_at.min)
    end
  end
end
