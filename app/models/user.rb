class User < ApplicationRecord
  has_many :user_has_skills
  has_many :skills, through: :user_has_skills
  has_many :book_cases
  has_many :books, through: :book_cases
  belongs_to :job
end
