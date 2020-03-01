class Magazine < ApplicationRecord
  validates :title, presence: true
  validates :published_at, presence: true
  validates :isbn, presence: true

  validate :has_authors?

  def has_authors?
    errors.add(:authors, :required) if authors.blank?
  end
end
