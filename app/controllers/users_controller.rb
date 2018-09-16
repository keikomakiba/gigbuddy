class UsersController < ApplicationController
  def new
   @user = User.new
  end
  
  def create
   @user = User.new(user_params)
   if @user.save
        redirect_to user_path(@user.id)
      else
        render 'new'
   end
  end
  
  def show
   @user = User.find(params[:id])
   @participants_gigs = @user.participant_gigs
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
     if current_user == @user
    if @user.update(user_params)
      redirect_to user_path, notice: "edit profile！"
    else
      render 'edit'
    end
     end
  end
  
  def index
    @users = User.all
  end
  

  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:image, :profile )
  end
 
end

