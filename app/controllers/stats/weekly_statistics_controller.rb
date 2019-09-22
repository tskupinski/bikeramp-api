class Stats::WeeklyStatisticsController < ApplicationController
  def show
    weekly_statistics = WeeklyStatistics.new
    render json: weekly_statistics
  end
end
