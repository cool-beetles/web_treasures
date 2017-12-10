class TreasuresController < ApplicationController
  def index
    @treasures = current_user.treasures.untrashed
  end

  def show
    @treasure = Treasure.find(params[:id])
  end

  def new
    @treasure = Treasure.new
  end

  def create
    @treasure = current_user.treasures.build(params_treasure)
   
    if @treasure.save
      redirect_to @treasure 
    else
      render :new
    end
  end

  def edit    
    @treasure = Treasure.find(params[:id])
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
    @treasures = current_user.treasures.trashed
  end

  helper_method :current_user

  private
  
  def params_treasure
    params.require(:treasure).permit(:type_id, :title, :description, :special_note, :storage_id, :trashed)
  end
end
