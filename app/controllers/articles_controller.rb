class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @articles.destroy
    redirect_to articles_path
  end

  private
  # protection from attack !!!

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params['id'])
  end

end
