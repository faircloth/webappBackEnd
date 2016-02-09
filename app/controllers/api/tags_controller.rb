class Api::TagsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token

  def index
    render json: Tag.all 
  end

  def show
    tag = Tag.find(params[:id])
    render json: tag
    # not working to include articles
    # render json: tag.as_json(include::articles)
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      render status: 200, json: {
        message: "Successfully created tag",
        tag: tag
      }.to_json
    else
      render status: 422, json: {
        errors: tag.errors
      }.to_json
    end
  end

  def update
    tag = Tag.find(params[:id])
    if tag.update(tag_params)
      render status: 200, json: {
        message: "Successfully updated tag",
        tag: tag
      }.to_json
    else
      render status: 422, json: {
        message: "The tag could not be updated",
        tag: tag
      }.to_json
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    render json: {
      status: 200,
      message: "Successfully deleted Tag"
    }.to_json
  end

  private
  
  def tag_params
    params.require("tag").permit("name")
  end

end