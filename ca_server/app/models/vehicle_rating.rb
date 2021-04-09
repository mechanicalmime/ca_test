class VehicleRating < ApplicationRecord
  enum rating: [:excellent, :good, :bad]
  belongs_to :vehicle

  validates :price, presence: true
  validates :rating, presence: true
end