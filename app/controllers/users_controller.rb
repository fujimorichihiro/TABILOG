class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: current_user.id)
  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    redirect_to user_path(user)
  end

  def follower
  end

  def followed
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
