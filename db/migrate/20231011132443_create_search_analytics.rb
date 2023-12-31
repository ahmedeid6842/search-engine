class CreateSearchAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :search_analytics do |t|
      t.string :query
      t.integer :searched, default: 0
      t.integer :found,  default: 0

      t.timestamps
    end
  end
end
