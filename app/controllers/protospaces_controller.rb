class ProtospacesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def index
    @protospaces = Protospace.all
    # binding.pry
    @user = current_user 
  end

  def new
    @protospace = Protospace.new
  end

  def create
    @protospace = Protospace.new(protospace_params)
  
    if @protospace.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    protospace = Protospace.find(params[:id])
    protospace.destroy
    redirect_to root_path
  end

  def edit
    @protospace = Protospace.find(params[:id])
  end

  def update
    protospace = Protospace.find(params[:id])
    protospace.update(protospace_params)
    redirect_to root_path
  end

  def show
    # @protospace = Protospace.new
    # @comments = @protospace.comments.includes(:user)
    @protospace = Protospace.find(params[:id])
  end

  private

  def protospace_params
    params.require(:protospace).permit(:title, :image, :catch_copy, :concept)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end