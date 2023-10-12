class UpdateSearchAnalyticsDatesJob < ApplicationJob
  queue_as :default

  def perform(input)
    search_analytic = SearchAnalytic.find_by(query: input[:query])
    
    search_analytic_date = SearchAnalyticsDate.find_or_initialize_by(
      search_analytic: search_analytic, 
      users: input[:user],
      searched_date: Date.today
    )
  
    search_analytic_date.update(hits: search_analytic_date.hits + 1)

    search_analytic_date.save
  end
end
