class Question < ApplicationRecord
  belongs_to :subject

  validates :description, presence: true
  validates :subject, presence: true

  def print_question
    return "Question: #{description}"
  end
end
