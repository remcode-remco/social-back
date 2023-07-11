class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :update, :destroy]

  def index
    @keywords = Keyword.all
    render json: @keywords
  end

  def show
    render json: @keyword
  end

  def create
    @keyword = Keyword.new(keyword_params)
    if @keyword.save
      render json: @keyword, status: :created
    else
      render json: @keyword.errors, status: :unprocessable_entity
    end
  end

  def update
    if @keyword.update(keyword_params)
      render json: @keyword
    else
      render json: @keyword.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @keyword.destroy
    head :no_content
  end

  private

  def set_keyword
    @keyword = Keyword.find(params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:keyword)
  end
end
