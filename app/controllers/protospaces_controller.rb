class ProtospacesController < ApplicationController


  def index
    @protospaces = Protospace.all
  end

  def new
    @protospace = Protospace.new
  end

  def create
    Protospace.create(protospace_params)
    redirect_to '/'
  end

  def destroy
    protospace = Protospace.find(params[:id])
    protospace.destroy
    redirect_to root_path
  end

  def show
    @protospace = Protospace.new
  # @comments = @tweet.comments.includes(:user)
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