class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    last_week_search_analytics = SearchAnalytic.where(updated_at: 1.day.ago..DateTime.now).order(searched: :desc).limit(10)
    # Pass the last week's search analytics to the view.
    @last_week_search_analytics = last_week_search_analytics
  end
end