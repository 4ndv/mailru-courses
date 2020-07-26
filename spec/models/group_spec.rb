# frozen_string_literal: true

RSpec.describe Group, type: :model do
  subject { create(:group) }

  it { should be_kind_of(Group) }
end
