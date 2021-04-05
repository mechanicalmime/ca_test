class VehicleModel < ApplicationRecord
  belongs_to :vehicle_brand

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :vehicle_brand, presence: true
end
