class UserKeyWordsAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :user_key_words_analytics do |t|
      t.references :users, null: false, foreign_key: true
      t.string :keywords

      t.timestamps
    end
  end
end
