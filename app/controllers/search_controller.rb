class SearchController < ApplicationController
    before_action :authenticate_user!

    def search
      query = params[:query]&.strip
      return if query.blank?

      @articles = Article.where('title LIKE ? OR content LIKE ?', "%#{query}%", "%#{query}%")

      if query.include?('?')
        update_search_analytics(query,@articles)
        update_search_analytics_dates(query, current_user)
      end


      render json: { articles: @articles }
    end

    def update_search_analytics(query,articles)
      search_analytic = SearchAnalytic.find_or_initialize_by(query: query)
  
        search_analytic.update(searched: search_analytic.searched + 1)

      if articles.length 
        search_analytic.update(found: search_analytic.found + 1)
      end
      search_analytic.save
    end

    def update_search_analytics_dates(query, user)
      search_analytic = SearchAnalytic.find_by(query: query)
    
      search_analytic_date = SearchAnalyticsDate.find_or_initialize_by(
        search_analytic: search_analytic, 
        users: user,
        searched_date: Date.today
      )
    
      search_analytic_date.update(hits: search_analytic_date.hits + 1)

      search_analytic_date.save
    end
end