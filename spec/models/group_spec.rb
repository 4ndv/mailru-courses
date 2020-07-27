# frozen_string_literal: true

RSpec.describe Group, type: :model do
  subject { create(:group) }

  it { should be_kind_of(Group) }

  describe "start_at" do
    it { should validate_presence_of(:start_at) }
  end

  describe "#update_closest_starting_group" do
    it "must update it's course if it starts before" do
      group = create(:group)

      expect(group.course.closest_starting_group.id).to eq(group.id)

      new_group = create(:group, course: group.course, start_at: group.start_at - 2.days)

      expect(group.course.closest_starting_group.id).to eq(new_group.id)
    end
  end
end
