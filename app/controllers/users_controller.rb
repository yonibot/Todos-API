
class UsersController < AuthController

  def create
    user = User.new(user_params)
    if user.save
      response.headers["AUTH-TOKEN"] = user.token
      render json: {user: user.attributes.except('password_digest', 'id')}
    else
      render json: {error: user.errors.full_messages}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end
