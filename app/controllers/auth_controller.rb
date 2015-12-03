class AuthController < ApplicationController

  def login
    user = User.where(email: params[:user][:email]).first
    if user && user.authenticate(params[:user][:password])
      response.headers["AUTH-TOKEN"] = user.token
      render json: {user: user.attributes.except('password_digest', 'id')}
    else
      render json: {error: "Please check credentials"}, status: 401
    end
  end

  def logout
    if current_user
      current_user.update(token: SecureRandom.uuid)
      render json: {status: "User logged out."}
    else
      render json: {error: "No logged in user"}
    end
  end

  def current_user
    User.where(token: request.headers['AUTH-TOKEN']).first
  end

  protected

  def authenticate_from_token
    if !current_user
      render json: {error: "Unauthorized."}, status: 401
    end
  end

end
