class AuthController < ApplicationController
  def register
    register_params = params.permit(:first_name, :last_name, :username, :password, :bio, :date_of_birth, :nationality, :education_status, :address, :email, :phone_number, :organization, :website, :github, :instagram, :facebook, :twitter)
    user = User.create(register_params)

    if user.valid?
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base, 'HS256')
      render json: { user: UserSerializer.new(user), token: token }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base, 'HS256')
      render json: { user: UserSerializer.new(user), token: token }
    else
      render json: { message: "User not found!"}, status: :unauthorized
    end
  end

end
