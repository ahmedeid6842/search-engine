class RenameHitToCurrentHitAtGlobalHitTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :global_key_words_analytics, :day_hit, :current_day_hit
    rename_column :global_key_words_analytics, :week_hit, :current_week_hit
    rename_column :global_key_words_analytics, :month_hit, :current_month_hit
  end
end
