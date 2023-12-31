class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
  
    def new
      @article = Article.new
    end
  
    def create
      @article = current_user.articles.build(article_params)
      if @article.save
        redirect_to root_path, notice: 'Article was successfully created.'
      else
        render :new
      end
    end
  
    def show
      @article = Article.find(params[:id])
    end
    
    private
  
    def article_params
      params.require(:article).permit(:title, :content)
    end
  end