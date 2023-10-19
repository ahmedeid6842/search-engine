class AddPreviousHitsCountToGlobalHits < ActiveRecord::Migration[7.0]
  def change
    add_column :global_key_words_analytics, :previous_day_hit, :integer, default: 0
    add_column :global_key_words_analytics, :previous_week_hit, :integer, default: 0
    add_column :global_key_words_analytics, :previous_month_hit, :integer, default: 0
  end
end
