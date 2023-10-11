class CreateSearchAnalyticsDates < ActiveRecord::Migration[7.0]
  def change
    create_table :search_analytics_dates do |t|
      t.references :search_analytics, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.date :searched_date
      t.integer :hits

      t.timestamps
    end
  end
end
