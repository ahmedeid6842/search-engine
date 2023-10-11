class HomeController < ApplicationController
    before_action :authenticate_user!

    def search
      query = params[:query]&.strip
      return if query.blank?

      @articles = Article.where('title LIKE ? OR content LIKE ?', "%#{query}%", "%#{query}%")

      render json: { articles: @articles }
    end

    def index
      render
    end
  end