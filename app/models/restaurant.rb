class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CATEGORY = %w[chinese italian japanese french belgian]

  validates :name, presence: true, exclusion: { in: [""] }
  validates :address, presence: true, exclusion: { in: [""] }
  # validates :phone_number, format: { with: /\A[a-zA-Z]+\z/,
  validates :category, presence: true, inclusion: { in: CATEGORY }

  def self.getCategories
    CATEGORY
  end
end
