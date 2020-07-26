# frozen_string_literal: true

RSpec.describe Student, type: :model do
  subject { create(:student) }

  it { should be_kind_of(Student) }
end
