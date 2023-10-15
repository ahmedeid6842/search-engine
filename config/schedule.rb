env :PATH, ENV['PATH']
set :output, './log/cron.log'

every 1.day do 
    runner "GlobalKeyWordsAnalytic.update_previous_day_rank_reset"
end

every 1.week, at: '12pm' do 
    runner "GlobalKeyWordsAnalytic.update_previous_week_rank_reset"
end

every 1.month, at: '12pm' do
    runner "GlobalKeyWordsAnalytic.update_previous_month_rank_reset"
end
