class Book < ApplicationRecord
  belongs_to :book_cases
  has_many :book_cases
  has_many :users, through: :book_cases
  has_many :tag_has_books
  has_many :tag, through: :tag_has_books
end
