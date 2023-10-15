class GlobalKeyWordsAnalytic < ApplicationRecord
    def self.update_previous_day_rank_reset
        records = order(day_hit: :desc, updated_at: :desc)
        records.each_with_index do |record, index|
            record.update(previous_day_rank: index+1)
        end
        update_all(day_hit: 0)
    end

    def self.update_previous_week_rank_reset
        records = order(week_hit: :desc, updated_at: :desc)
        records.each_with_index do |record, index|
            record.update(previous_week_rank: index+1)
        end
        update_all(week_hit: 0)
    end

    def self.update_previous_month_rank_reset
        records = order(month_hit: :desc, updated_at: :desc)
        records.each_with_index do |record, index|
            record.update(previous_month_rank: index+1)
        end
        update_all(month_hit: 0)
    end
end
