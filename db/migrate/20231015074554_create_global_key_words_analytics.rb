class CreateGlobalKeyWordsAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :global_key_words_analytics do |t|
      t.string :keyword

      t.integer :day_hit, default: 0
      t.integer :previous_day_rank, default: 0
      
      t.integer :week_hit, default: 0
      t.integer :previous_week_rank, default: 0
      
      t.integer :month_hit, default: 0
      t.integer :previous_month_rank, default: 0
      
      t.timestamps
    end
  end
end
