class UserController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @user = current_user
  end

  def show 
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html {redirect_to current_user, notice: "successfully updated!"}
      else
        format.html { render :edit}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :bio,
      :first_name,
      :last_name
    )
  end
end
