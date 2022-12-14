require 'rails_helper'

RSpec.describe Subject, type: :model do
  context "is valid when" do
    it 'has description' do
      subject = build(:subject)
      subject.valid?
      expect(subject).to be_valid
      expect(subject.errors.size).to eq(0)
    end
  end

  context 'is invalid when' do
    it 'has no description' do
      subject = build(:subject, :invalid_subject)
      subject.valid?
      expect(subject).not_to be_valid
      expect(subject.errors.size).to be >= 1
      expect(subject.errors).to have_key(:description)
    end
  end

  context 'should' do
    it 'print his title' do
      subject = build(:subject)
      printed = subject.print_title
      expect(printed).to eq("Questions about #{subject.description}")
    end
  end
  
end

