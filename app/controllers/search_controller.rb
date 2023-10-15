class SearchController < ApplicationController
    before_action :authenticate_user!

    def search
      query = params[:query]&.strip
      return if query.blank?
      
      @articles = Article.where('title ILIKE ? OR content ILIKE ?', "%#{query}%", "%#{query}%")
      
      if query.include?('?')
        UpdateKeyWordsAnalyticsJob.perform_later({keywords: query_tokenizer(query.downcase), user:current_user})
        UpdateGlobalKeyWordsAnalyticsJob.perform_later({keywords: query_tokenizer(query.downcase)})
        UpdateSearchAnalyticsJob.perform_later({query: query, articles: @articles.to_a, user: current_user})
      end

      render json: { articles: @articles.as_json(include: { author: { only: :name } }) }
    end

    private 
    def query_tokenizer(query)
      tgr = EngTagger.new
      tgr.get_words(query)
    end
end