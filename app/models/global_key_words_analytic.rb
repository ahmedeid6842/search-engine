class GlobalKeyWordsAnalytic < ApplicationRecord
    def self.update_previous_day_rank_reset
        records = order(current_day_hit: :desc, updated_at: :desc)
        records.each_with_index do |record, index|
            record.update(previous_day_rank: index+1, previous_day_hit: record.current_day_hit)
        end
        update_all(current_day_hit: 0)
    end

    def self.update_previous_week_rank_reset
        records = order(current_week_hit: :desc, updated_at: :desc)
        records.each_with_index do |record, index|
            record.update(previous_week_rank: index+1, previous_week_hit: current_week_hit)
        end
        update_all(current_week_hit: 0)
    end

    def self.update_previous_month_rank_reset
        records = order(current_month_hit: :desc, updated_at: :desc)
        records.each_with_index do |record, index|
            record.update(previous_month_rank: index+1, previous_month_hit: current_month_hit)
        end
        update_all(current_month_hit: 0)
    end
end
