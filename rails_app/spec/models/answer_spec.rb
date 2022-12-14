require 'rails_helper'

RSpec.describe Answer, type: :model do
  context 'is valid when' do
    it 'has a valid subject and description' do      
      question = build(:question)
      question.valid?
      expect(question.subject).to be_kind_of(Subject)
      expect(question.description).not_to eq("")
      expect(question.description).not_to be_nil
    end
  end

  context 'is invalid when' do
    it 'has no description' do
      question = build(:question, :no_description)
      question.valid?
      expect(question).not_to be_valid
      expect(question.errors).to have_key(:description)
    end

    it 'has no valid subject' do
      question = build(:question, :no_subject)
      question.valid?
      expect(question.subject).to be nil
      expect(question.errors).to have_key(:subject)
    end
  end

  context 'should' do
    it 'print question' do
      question = build(:question)
      desc = question.print_question
      expect(desc).to eq("Question: #{question.description}")
    end
  end
end
