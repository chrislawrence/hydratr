module CalculationsHelper
  def clean(number)
    number_with_precision(number,:precision => 2,:strip_insignificant_zeros => true)
  end
  
  def hourly_default
    true if session[:default_method] == 'hourly'
  end
  
  def daily_default
    true if session[:default_method] == 'daily'
  end
  
  def random_gender
    r = rand(0..1)
    if r == 0
      return 'boy'
    else
      return 'girl'
    end
  end 
end
