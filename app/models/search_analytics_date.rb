class SearchAnalyticsDate < ApplicationRecord
  belongs_to :search_analytic
  belongs_to :users, class_name: 'User'
end
