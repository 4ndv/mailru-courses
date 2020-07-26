# frozen_string_literal: true

RSpec.describe Group, type: :model do
  subject { create(:group) }

  it { should be_kind_of(Group) }

  describe "start_at" do
    it { should validate_presence_of(:start_at) }
  end
end
