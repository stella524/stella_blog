class ArticlesController < ApplicationController
  
  before_action :find_article, only:[:show,:edit,:update,:destroy]
  before_action :sign_in_and_admin_required, only:[:edit,:update,:destroy,:new,:create]
  
  def index
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(9)
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
     
    if @article.update(article_params)
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
  
  def search
    @search = Article.where(genre: params[:search]).order(created_at: :DESC).page(params[:page]).per(9)
  end
  
  def blog
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(9)
  end
  
  private
  
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title,:body,:image,:genre)
  end
  
 
end
