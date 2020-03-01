class Book < Publication
  validates :description, presence: true
  validates :title, presence: true
  validates :isbn, presence: true
end
