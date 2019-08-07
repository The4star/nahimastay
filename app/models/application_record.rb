class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def calculate_average(num_arr)
    total = 0
    num_arr.each do |number|
      total = total + number
    end

    return (total / num_arr.length)
  end
  
end
