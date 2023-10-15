class UpdateGlobalKeyWordsAnalyticsJob < ApplicationJob
  queue_as :default

  def perform(input)
    keywords = query_tokenizer(input[:query]);
    keywords.keys.each do |key|
      keyword = GlobalKeyWordsAnalytic.find_or_initialize_by(keyword: key)
      keyword.day_hit += 1
      keyword.week_hit += 1
      keyword.month_hit += 1

      keyword.save
    end
  end

  private 
  def query_tokenizer(query)
    tgr = EngTagger.new
    tgr.get_words(query)
  end

end
