class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t "controllers.users_controller.user_not_found"
    redirect_to new_user_path
  end
end
