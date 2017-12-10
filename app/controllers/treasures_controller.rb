class TreasuresController < ApplicationController
  def index
    @treasures = Treasure.untrashed
    @treasures = @treasures.where(owner_id: current_user.id)
  end

  def show
    @treasure = Treasure.find(params[:id])
  end

  def new
    @treasure = Treasure.new
  end

  def create
    @treasure = Treasure.new(params_treasure)

    if @treasure.save
      redirect_to @treasure 
    else
      render :new
    end
  end

  def edit    
    @treasure = Treasure.find(params[:id])
    render :edit
  end

  def update
    @treasure = Treasure.find(params[:id])
    
    if @treasure.update(params_treasure)
      redirect_to @treasure
    else
      render :edit
    end
  end

  def destroy
    @treasure = Treasure.find(params[:id])
    @treasure.trashed = true
    @treasure.save

    redirect_to treasures_path
  end

  def trash
    @treasures = Treasure.trashed
    @treasures = @treasures.where(owner_id: current_user.id)
  end

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.first
  end

  def params_treasure
    params.require(:treasure).permit(:owner_id, :type_id, :title, :description, :special_note, :storage_id, :trashed)
  end
end
