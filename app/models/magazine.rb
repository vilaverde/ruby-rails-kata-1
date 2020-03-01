class Magazine < ApplicationRecord
  validates :title, presence: true
  validates :published_at, presence: true
  validates :isbn, presence: true
end
