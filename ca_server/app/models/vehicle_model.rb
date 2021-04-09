class VehicleModel < ApplicationRecord
  belongs_to :vehicle_brand

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :vehicle_brand, presence: true
  validates :market_price, numericality: {greater_than: 0}

  delegate :name, to: :vehicle_brand, prefix: :brand
end
