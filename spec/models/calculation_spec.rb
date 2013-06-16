require 'spec_helper'

describe Calculation do
  it "calculates the correct values for hourly method" do
    calculation = create(:hourly)
    expect(calculation.deficit).to eq(1000)
    expect(calculation.hourly_maintenance).to eq(60)
    expect(calculation.hourly_deficit).to eq(41.666666666666664)
    expect(calculation.hourly_method_total).to eq(2440)
  end
  
  it "calculates the correct values for daily method" do
    calculation = create(:daily)
    expect(calculation.daily_method_maintenance_per_hour).to eq(62.5)
    expect(calculation.hourly_deficit).to eq(41.666666666666664)
  end
end
