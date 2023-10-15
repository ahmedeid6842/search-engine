
class SetDefaulValueToHits < ActiveRecord::Migration[7.0]
  def change
    change_column_default :global_key_words_analytics, :current_day_hit, 0
    change_column_default :global_key_words_analytics, :current_week_hit, 0
    change_column_default :global_key_words_analytics, :current_month_hit, 0
  end
end
