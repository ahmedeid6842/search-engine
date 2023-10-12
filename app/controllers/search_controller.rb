class SearchController < ApplicationController
    before_action :authenticate_user!

    def search
      query = params[:query]&.strip
      return if query.blank?

      @articles = Article.where('title LIKE ? OR content LIKE ?', "%#{query}%", "%#{query}%")

      if query.include?('?')
        UpdateSearchAnalyticsJob.perform_later({query: query, articles: @articles.to_a})
        UpdateSearchAnalyticsDatesJob.perform_later({query: query, user: current_user})
      end


      render json: { articles: @articles }
    end
end