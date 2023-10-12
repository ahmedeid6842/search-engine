class UpdateSearchAnalyticsJob < ApplicationJob
  queue_as :default

  def perform(input)
    search_analytic = SearchAnalytic.find_or_initialize_by(query: input[:query])

    search_analytic.update(searched: search_analytic.searched + 1)
    
    if input[:articles].length > 0
      search_analytic.update(found: search_analytic.found + 1)
      input[:articles].each do |article|
        article.update(searched_hits: article.searched_hits + 1)
        article.save
      end
    end

    search_analytic.save
  end
end
