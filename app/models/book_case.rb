class BookCase < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :note
end
