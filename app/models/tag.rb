class Tag < ApplicationRecord
  has_many :tag_has_books
  has_many :books, through: :tag_has_books
end
