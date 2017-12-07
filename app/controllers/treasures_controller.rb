class TreasuresController < ActionController::Base
  def index
    @treasures = Treasure.all
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
      render action: 'new'
    end
  end

  def edit
    @treasure = Treasure.find(params[:id])
    render action: 'edit'
  end

  def update
    @treasure = Treasure.find(params[:id])
    if @treasure.update(params_treasure)
      redirect_to @treasure
    else
      render :edit
    end
  end

  private 

  def params_treasure
    params.require(:treasure).permit(:owner_id, :type_id, :title, :description, :special_note, :storage_id, :trashed)
  end
end
