class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@users =  User.all
  end

  def new
  	@user = User.new
  end

  def create
   @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
