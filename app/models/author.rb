class Author < ApplicationRecord
  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
end
