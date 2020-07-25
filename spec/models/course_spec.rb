# frozen_string_literal: true

RSpec.describe Course, type: :model do
  subject { create(:course) }

  it { should be_kind_of(Course) }
end
