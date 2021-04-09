class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  has_one :vehicle_rating, dependent: :destroy

  validates :year, presence: true
  validates :mileage, presence: true
  validates :listed_price, numericality: {greater_than: 0}

  before_create :set_vehicle_rating

  delegate :market_price, :brand_name, to: :vehicle_model
  delegate :name, to: :vehicle_model, prefix: :model
  delegate :price, to: :vehicle_rating, prefix: :final_market
  delegate :rating, to: :vehicle_rating

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
    where(listed_price: ..(price.to_i - 1))
  }

  scope :filter_by_rating, ->(rating){
    joins(:vehicle_rating).where(vehicle_rating: {rating: rating})
  }

  def self.filter_by(filters)
    results = self.all

    filters.each do |key, value|
      results = results.public_send("filter_by_#{key}", value) if value && !value.empty?
    end

    results
  end

  private

  def set_vehicle_rating
    self.vehicle_rating = RatingCalculator.calculate_for(vehicle: self)
  end
end
