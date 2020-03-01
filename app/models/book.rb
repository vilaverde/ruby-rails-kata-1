class Book < ApplicationRecord
  validates :description, presence: true
  validates :title, presence: true
  validates :isbn, presence: true

  has_and_belongs_to_many :authors
end
