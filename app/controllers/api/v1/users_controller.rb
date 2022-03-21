class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = get_user_from_token
    render json: {
      message: "If you see this you're in!",
      user: user
    }
  end

  def update
    new_attrs = create_params(%i[id email role created_at updated_at first_name second_name phone address build apartment post_code country city password password_confirmation])
    new_attrs.delete(:role) unless current_user.admin?
    old_user = User.find(new_attrs[:id])
    if old_user.update(new_attrs)
      render json: { user: User.find(new_attrs[:id]) }, status: :ok
    else
      render json: { message: "Can't save!" }, status: 500
    end
  end

  private

  def get_user_from_token
    token = request.headers['Authorization'].split(' ')[1]
    jwt_payload = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY']).first
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end

  private

  def create_params(permitted_params)
    params.require(controller_name.classify.downcase.to_sym).permit(*permitted_params)
  end
end
