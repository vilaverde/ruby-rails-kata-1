class Author < ApplicationRecord
  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  has_and_belongs_to_many :books
end
