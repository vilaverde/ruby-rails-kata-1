class Publication < ApplicationRecord
  has_and_belongs_to_many :authors

  validate :has_authors?

  def has_authors?
    errors.add(:authors, :required) if authors.blank?
  end
end
