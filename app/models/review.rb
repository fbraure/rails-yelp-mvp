class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  # presence: true, inclusion: { in: (1..5).to_a }
  validates :content, presence: true, exclusion: { in: [""] }

end
