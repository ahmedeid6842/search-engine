class SearchAnalyticsDate < ApplicationRecord
  belongs_to :search_analytics
  belongs_to :searcher, class_name: 'User'
end
