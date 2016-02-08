class Api::ArticlesController < ApplicationController
  
  skip_before_filter :verify_authenticity_token

  def index
    render json: Article.all 
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def create
    article = @tag.articles.new(article_params)
    if article.save
      render status: 200, json: {
        message: "Successfully created article",
        tag: @tag,
        article: article
      }.to_json
    else
      render status: 422, json: {
        errors: article.errors
      }.to_json
    end
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render status: 200, json: {
        message: "Successfully updated article",
        article: article
      }.to_json
    else
      render status: 422, json: {
        message: "The article could not be updated",
        article: article
      }.to_json
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    render json: {
      status: 200,
      message: "Successfully deleted Article"
    }.to_json
  end

  private
  
  def article_params
    # params.require("article").permit("title")
    params.require(:article).permit(:title, :description, :tag)
  end

  def find_tag
    @tag = Article.find(params[:tag_id])
  end
  

end