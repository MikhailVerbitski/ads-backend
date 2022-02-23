class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!

  # def new; end
  # def edit; end
  def show
  end

  def create
    # if @post.save
    #   redirect_to @post
    # else
    #   flash.alert = "Can't save!"
    # end
  end

  def update
    # if @post.update(create_params)
    #   redirect_to @post
    # else
    #   flash.alert = "Can't Update!"
    # end
  end

  def destroy
    # @post.delete
    # redirect_to root_url, notice: 'Post deleted'
  end

  def index
    render json: Post.all
  end
end
