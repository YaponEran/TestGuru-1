class Test < ApplicationRecord
  belongs_to :category, class_name: "Author"
  has_many :passed_tests
  has_many :users, through: :passed_tests
  has_many :questions

  def find_by_category(category)
  Test.joins('JOIN categories ON categories.id = tests.category_id').
  where(categories: { title: category }).
  order(title: :desc).
  pluck(:title)
  end
end
