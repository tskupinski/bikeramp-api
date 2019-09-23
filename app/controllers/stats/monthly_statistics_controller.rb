class Stats::MonthlyStatisticsController < ApplicationController
  def show
    monthly_statistics = PrepareMonthlyStatistics.new.call
    render json: monthly_statistics
  end
end
