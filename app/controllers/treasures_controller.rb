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
    @treasure = Treasure.new(treasure_params)

    if @treasure.save
      redirect_to @treasure
    else
      render action: 'new'
    end
  end

  private

  def treasure_params
    owner = User.where(id: params[:owner_id]).first
    type = Type.where(id: params[:type_id]).first
    storage = Storage.where(id: params[:storage_id]).first
    params.require(:treasure).permit(:owner, :type, :title, :description, :special_note, :storage, :trashed)
  end
end
