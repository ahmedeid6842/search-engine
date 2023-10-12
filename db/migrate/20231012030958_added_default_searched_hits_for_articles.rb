class AddedDefaultSearchedHitsForArticles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :articles, :searched_hits, 0
  end
end
