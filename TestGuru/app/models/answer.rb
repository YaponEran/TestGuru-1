class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_max_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:question) if question.answers.count > 4
  end
end
