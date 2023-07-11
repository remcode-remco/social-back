# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    radius = params[:radius].to_f

    locations_within_radius = Location.within_radius(latitude, longitude, radius)
    post_ids = locations_within_radius.map(&:post_ids).flatten.uniq

    @posts = Post.where(id: post_ids)

    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id, :location_id)
  end
end