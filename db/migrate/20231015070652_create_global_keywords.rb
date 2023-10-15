class CreateGlobalKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :global_keywords do |t|
      t.string :keyword

      t.integer :day_hit
      t.integer :previous_day_rank
      
      t.integer :week_hit
      t.integer :previous_week_rank
      
      t.integer :month_hit
      t.integer :previous_month_rank
      
      t.timestamps
    end
  end
end
