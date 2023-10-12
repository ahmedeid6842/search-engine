class AnalyticsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      user = current_user
  
      global_last_day_search_analytics = SearchAnalytic.where(updated_at: 1.day.ago..DateTime.now).order(searched: :desc).limit(10)

      last_week_search_analytics = SearchAnalyticsDate.where(users: user, searched_date: 1.week.ago..Date.today).order(hits: :desc).limit(10)
  
      sum_searched = SearchAnalytic.sum(:searched)
      sum_found = SearchAnalytic.sum(:found)

      render 'analytics', locals: { last_week_search_analytics: last_week_search_analytics, global_last_day_search_analytics: global_last_day_search_analytics, searched: sum_searched, found: sum_found }
    end
  end