class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :update, :destroy]

  def show
    render json: @reply
  end

  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      render json: @reply, status: :created
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reply.update(reply_params)
      render json: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reply.destroy
    head :no_content
  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:content, :user_id, :post_id)
  end
end
