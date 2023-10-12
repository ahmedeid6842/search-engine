class AddIndexToArticlesAndAnalytics < ActiveRecord::Migration[7.0]
  def change
    add_index :articles, :title
    add_index :articles, :content
    add_index :search_analytics, :query
  end
end
