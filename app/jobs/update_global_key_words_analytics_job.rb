class UpdateGlobalKeyWordsAnalyticsJob < ApplicationJob
  queue_as :default

  def perform(input)
    input[:keywords].keys.each do |key|
      keyword = GlobalKeyWordsAnalytic.find_or_initialize_by(keyword: key)
      keyword.day_hit += 1
      keyword.week_hit += 1
      keyword.month_hit += 1

      keyword.save
    end
  end
end
