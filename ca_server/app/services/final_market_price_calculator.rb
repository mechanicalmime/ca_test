module FinalMarketPriceCalculator
    MAXIMUM_MILEAGE = 20000
    YEAR_LIMIT = 2020
    CURRENT_YEAR = Date.today.year.to_i
    YEAR_DEPRECIATION_PERCENTAGE = 15

    def self.calculate_for(vehicle:)
        if vehicle.year >= YEAR_LIMIT
            FinalMarketPriceForNewer.calculate_for(vehicle: vehicle)
        else
            FinalMarketPriceForOlder.calculate_for(vehicle: vehicle)
        end
    end

    private

    module FinalMarketPriceForNewer
        def self.calculate_for(vehicle:)
            mileage_depreciation = calculate_mileage_depreciation(mileage: vehicle.mileage, 
                                                                  market_price: vehicle.market_price)

            year_depreciation = calculate_year_depreciation(year: vehicle.year, 
                                                            market_price: vehicle.market_price)
            
            vehicle.market_price - year_depreciation - mileage_depreciation
        end

        private

        def self.calculate_mileage_depreciation(mileage:, market_price:)
            mileage > MAXIMUM_MILEAGE ? market_price * 0.02 : 0
        end

        def self.calculate_year_depreciation(year:, market_price:)
            market_price * (0.15 * (CURRENT_YEAR - year))
        end
    end

    module FinalMarketPriceForOlder
        def self.calculate_for(vehicle:)
            year_depreciation = calculate_year_depreciation(year: vehicle.year, 
                                                            market_price: vehicle.market_price)

            mileage_depreciation = calculate_mileage_depreciation(year: vehicle.year,
                                                                  mileage: vehicle.mileage, 
                                                                  market_price: vehicle.market_price)

            vehicle.market_price - year_depreciation - mileage_depreciation
        end

        private

        def self.calculate_max_mileage(year:)
            20000 * (CURRENT_YEAR - year)
        end

        def self.calculate_year_depreciation(year:, market_price:)
            extra_percent_per_year = (CURRENT_YEAR - year) * 0.01
            market_price * (0.15 + extra_percent_per_year)   
        end

        def self.calculate_mileage_depreciation(year:, mileage:, market_price:)
            max_mileage = calculate_max_mileage(year: year)

            if mileage > max_mileage
                market_price * 0.02
            elsif mileage < max_mileage
                -(market_price * 0.01)
            else
                0
            end
        end
    end
end