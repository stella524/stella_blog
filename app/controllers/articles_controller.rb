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
      redirect_to root_path, message:"Article was created,successfully"
    else
      render "new", alert:"Article was not created, cause some of issues"
    end
  end

  def edit
    
  end

  def update
    @article = Article.update_attributes(article_params)
    if @article.save
      redirect_to root_path,message:"Article has edited,successfully" 
    else
      render "edit", alert:"投稿の編集に失敗しました"
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, message:"投稿を削除しました"
    else
      redirect_to root_path, alert:"投稿を削除できませんでした"
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
