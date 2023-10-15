require 'json'

class UserKeyWordsAnalytic < ApplicationRecord
    belongs_to :users, class_name: 'User'

    def update_keywords(new_keywords)
        existing_keywords = keywords.nil? ? {} : JSON.parse(keywords.gsub('=>', ':'))
        
        new_keywords.each do |keyword,count|
            if(existing_keywords.key?(keyword))
                existing_keywords[keyword] += count
            else
                existing_keywords[keyword] = count
            end
        end
        existing_keywords = existing_keywords.sort_by {|key, value| value}.reverse.to_h # sort keywords to can use it while get top keywords
        self.keywords = existing_keywords.to_json
        self.save
    end
end
