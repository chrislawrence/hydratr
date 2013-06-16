class CalculationsController < ApplicationController
  def index
    random = rand(1..Calculation.count)
    @calculation = Calculation.order("RANDOM()").first
  end
  
  def preferences
    session[:default_method] = params[:default_method]
    logger.debug("SESSION ATTRIBUTE: #{session[:default_method]}")
    respond_to do |format| 
      format.js {render :nothing => true}
    end
  end
end
