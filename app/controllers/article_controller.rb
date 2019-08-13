class ArticleController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.save
    redirect_to articles_path
  end

  def edit
  end

  def update
    @articles.update(params[:article])
  end

  def destroy
    @articles.destroy
    redirect_to articles_path
  end

  private
  # protection from attack !!!

  def task_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @articles = Article.find(params[:id])
  end
end
