class UpdateKeyWordsAnalyticsJob < ApplicationJob
  queue_as :default

  def perform(input)
    user_keywords = UserKeyWordsAnalytic.find_or_initialize_by(users: input[:user]);
    updated_keywords = user_keywords.update_keywords(input[:keywords])
  end
end
