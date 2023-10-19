class AnalyticsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      user = current_user
  
      global_last_day_search_analytics = SearchAnalytic.where(updated_at: 1.day.ago..DateTime.now).order(searched: :desc).limit(10)

      last_week_search_analytics = SearchAnalyticsDate.where(users: user, searched_date: 1.week.ago..Date.today).order(hits: :desc).limit(10)
  
      trending_keywords_previous_day = GlobalKeyWordsAnalytic.order(previous_day_rank: :asc, updated_at: :desc).limit(100)
      trending_keywords_previous_week = GlobalKeyWordsAnalytic.order(previous_week_rank: :asc, updated_at: :desc).limit(100)
      trending_keywords_previous_month = GlobalKeyWordsAnalytic.order(previous_month_rank: :asc, updated_at: :desc).limit(100)


      sum_searched = SearchAnalytic.sum(:searched)
      sum_found = SearchAnalytic.sum(:found)

      render 'analytics', locals: { 
        last_week_search_analytics: last_week_search_analytics,
        global_last_day_search_analytics: global_last_day_search_analytics,
        searched: sum_searched,
        found: sum_found,
        trending_keywords_previous_day: trending_keywords_previous_day,
        trending_keywords_previous_week: trending_keywords_previous_week,
        trending_keywords_previous_month: trending_keywords_previous_month
      }
    end
  end