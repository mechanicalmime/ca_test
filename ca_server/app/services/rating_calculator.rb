module RatingCalculator
    def self.calculate_for(vehicle:)
        final_market_price = FinalMarketPriceCalculator.calculate_for(vehicle: vehicle)
        rating_level = calculate_rating_level(listed_price: vehicle.listed_price, final_market_price: final_market_price)

        VehicleRating.new(price: final_market_price, rating: rating_level)
    end

    private

    def self.calculate_rating_level(listed_price:, final_market_price:)
        if listed_price >= final_market_price * 1.10
            :bad
        elsif listed_price < final_market_price * 1.10 && listed_price > final_market_price * 0.80
            :good
        else
            :excellent
        end
    end
end