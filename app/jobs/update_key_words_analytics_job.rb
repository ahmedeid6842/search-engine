class UpdateKeyWordsAnalyticsJob < ApplicationJob
  queue_as :default

  def perform(input)
    user_keywords = UserKeyWordsAnalytic.find_or_initialize_by(users: input[:user]);
    
    keywords = query_tokenizer(input[:query]); 
    updated_keywords = user_keywords.update_keywords(keywords)
  end

  private 
  def query_tokenizer(query)
    tgr = EngTagger.new
    tagged = tgr.add_tags(query)
    tgr.get_nouns(tagged)
  end

end
