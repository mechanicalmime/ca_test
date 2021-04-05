class Vehicle < ApplicationRecord
  belongs_to :vehicle_model

  scope :filter_by_model_name, ->(query){
    joins(:vehicle_model).where("vehicle_models.name LIKE ?", "%#{query}%")
  }

  scope :filter_by_brand_name, ->(query){
    joins(vehicle_model: :vehicle_brand).where("vehicle_brands.name LIKE ?", "%#{query}%")
  }

  scope :filter_by_year, ->(year){
    where(year: (year.to_i + 1)..)
  }

  scope :filter_by_mileage, ->(mileage){
    where(mileage: ..(mileage.to_i - 1))
  }

  scope :filter_by_price, ->(price){
    where(price: ..(price.to_i - 1))
  }

  def self.filter_by(filters)
    results = self.all

    filters.each do |key, value|
      results = results.public_send("filter_by_#{key}", value) if value && !value.empty?
    end

    results
  end
end
