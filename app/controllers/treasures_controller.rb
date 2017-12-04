class TreasuresController < ActionController::Base
  def index
    @treasures = Treasure.all
  end
end
