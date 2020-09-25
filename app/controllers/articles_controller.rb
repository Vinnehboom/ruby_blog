class ArticlesController < ApplicationController
  def index
    @article = Article.all # @ instance variable making it accessible in the view
  end

  def show
    @article = Article.find(params[:id])
  end


  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article succesfully saved"

    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article succesfully updated"
    redirect_to article_path(@article)

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article succesfully deleted"

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:id, :title, :body, :author, :created_at, :updated_at, :notice)
  end

end
