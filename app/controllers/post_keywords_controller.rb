class PostKeywordsController < ApplicationController
  before_action :set_post_keyword, only: [:show, :update, :destroy]

  def index
    @post_keywords = PostKeyword.all
    render json: @post_keywords
  end

  def show
    render json: @post_keyword
  end

  def create
    @post_keyword = PostKeyword.new(post_keyword_params)
    if @post_keyword.save
      render json: @post_keyword, status: :created
    else
      render json: @post_keyword.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post_keyword.update(post_keyword_params)
      render json: @post_keyword
    else
      render json: @post_keyword.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post_keyword.destroy
    head :no_content
  end

  private

  def set_post_keyword
    @post_keyword = PostKeyword.find(params[:id])
  end

  def post_keyword_params
    params.require(:post_keyword).permit(:post_id, :keyword_id)
  end
end
