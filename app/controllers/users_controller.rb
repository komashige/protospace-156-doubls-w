class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @protospaces = @user.protospaces
  end

end
