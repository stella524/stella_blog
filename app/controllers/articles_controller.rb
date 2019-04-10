class ArticlesController < ApplicationController
  
  before_action :find_article, only:[:show,:edit,:update,:destroy]
  
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to root_path, flash: {notice: "Article was created,successfully"}
    else
      flash.now[:alert] = "Article couldn't be created, cause some of issues"
      render "new"
    end
  end

  def edit
    
  end

  def update
    @article = Article.update_attributes(article_params)
    if @article.save
      redirect_to root_path, flash: {notice: "Article has edited,successfully"}
    else
      flash.now[:alert] = "Article couldn't be edited"
      render "edit"
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, flash: {notice:"Article has deleted,successfully"}
    else
      redirect_to root_path, flash: {alert:"Article couldn't be deleted"}
    end
  end
  
  private
  
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title,:body,:image)
  end
end
