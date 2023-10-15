class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    recommended_articles = fetch_recommended_articles(current_user)
    render 'index', locals: { recommended_articles: recommended_articles.to_a }
  end
  
  def fetch_recommended_articles(user)
    user_keywords = UserKeyWordsAnalytic.find_or_initialize_by(users: current_user);
    user_keywords_array =user_keywords.nil? ? {} : JSON.parse(user_keywords.keywords).keys.first(10).shuffle() # shuufle the array to ge random order
    query_array = user_keywords_array.map{|k| "%#{k}%"}
    


    article = Article.where("title ILIKE ANY (ARRAY[?]) OR content ILIKE ANY (ARRAY[?])", 
                  query_array, query_array).limit(10)
  end
end