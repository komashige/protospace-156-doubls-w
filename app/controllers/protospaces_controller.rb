class ProtospacesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_protospace, only: [:edit, :show]


  def index
    @protospaces = Protospace.includes(:user)
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
    
  end
  
  def update
    protospace = Protospace.find(params[:id])
  
    if protospace.update(protospace_params)
      redirect_to protospace_path(protospace)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def show
    #@protospace = Protospace.new
    # @comments = @protospace.comments.includes(:user)

  end

  private

  def protospace_params
    params.require(:protospace).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    #params.require(:protospace).permit(:content, :filename,).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  
  def set_protospace
    @protospace = Protospace.find(params[:id])
  end
end