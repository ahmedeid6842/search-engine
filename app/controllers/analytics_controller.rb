class AnalyticsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      user = current_user
  
      last_week_search_analytics = SearchAnalyticsDate.where(users: user, searched_date: 1.week.ago..Date.today).order(hits: :desc).limit(10)
  
      render 'analytics', locals: { last_week_search_analytics: last_week_search_analytics }
    end
  end