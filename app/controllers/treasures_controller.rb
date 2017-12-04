class TreasuresController < ActionController::Base
  def index
    @treasures = Treasure.all
  end

  def show
    @treasure = Treasure.find(params[:id])
  end
end
