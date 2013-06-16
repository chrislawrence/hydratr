class Calculation < ActiveRecord::Base
  after_validation :calculate_deficit
  after_validation :calculate_maintenance

  def hourly_deficit
    deficit / 24
  end
  
  def daily_method_hourly_total
    total = hourly_deficit + daily_method_maintenance_per_hour
    if total > 100 
      return 100
    else
      return total
    end
  end
  
  def hourly_method_hourly_total
    total = hourly_deficit + hourly_maintenance
    if total > 100
      return 100
    else
      return total
    end
  end
  
  def daily_method_total
    total = deficit + daily_maintenance
    if total > 2400
      return 2400
    else
      return total
    end
  end
  
  def hourly_method_total
    total = deficit + hourly_method_maintenance_per_day
    if total > 2400
      return 2400
    else
      return total
    end
  end
  
  def hourly_method_maintenance_per_day
    hourly_maintenance * 24
  end
  
  def daily_method_maintenance_per_hour
    daily_maintenance / 24
  end

  private
  
  def calculate_deficit
    deficit = weight * dehydration * 10
    update_attribute(:deficit, deficit)
  end
  
  def calculate_maintenance
    hourly_maintenance = calculate_hourly_maintenance
    daily_maintenance = calculate_daily_maintenance
    update_attribute(:hourly_maintenance, hourly_maintenance)
    update_attribute(:daily_maintenance, daily_maintenance)
  end
  
  def calculate_hourly_maintenance
    i = 0
    maintenance = 0
    while i < weight
      if i < 10
        maintenance += 4
      elsif i < 20
        maintenance += 2
      else
        maintenance += 1
      end
      i += 1
    end
    return maintenance
  end
  
  def calculate_daily_maintenance
    i = 0
    maintenance = 0
    while i < weight
      if i < 10
        maintenance += 100
      elsif i < 20
        maintenance += 50
      else
        maintenance += 20
      end
      i += 1
    end
    return maintenance
  end
  
end
