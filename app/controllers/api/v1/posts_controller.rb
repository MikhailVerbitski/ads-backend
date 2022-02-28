class Api::V1::PostsController < ApplicationController
  load_and_authorize_resource

  PERMITTED_PARAMS = %i[body].freeze

  # def new; end
  # def edit; end
  def show
    render json: Post.find(params[:id]).to_json
  end

  def create
    post = Post.new(create_params)
    post.user_id = current_user.id
    if post.save
      render json: post.to_json, status: :ok
    else
      render json: { message: "Can't save!" }, status: 500
    end
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
    _pagy, records = pagy(Post, items: params[:count], page:  params[:page])
    render json: {
      records: records,
    }
  end

  private

  def create_params
    params.require(controller_name.classify.downcase.to_sym).permit(self.class::PERMITTED_PARAMS)
  end
end
