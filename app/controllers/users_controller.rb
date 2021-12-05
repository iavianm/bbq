class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: I18n.t('controllers.users.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_current_user
    @user = current_user
  end
     # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).permit(:name, :email)
  end
end
