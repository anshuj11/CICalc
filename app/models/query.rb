class Query < ApplicationRecord
    validates :principal, :rate, :years, :total, presence: true

    def calculate_total
      if check_valid  
         total = principal * (1 + (rate * years*0.01)) 
      else
          total = 0
      end   
    end

    def check_vals
        return total > 0 && principal > 0 && rate > 0 && years > 0
    end

    def check_valid
        return principal && rate && years
    end
end
