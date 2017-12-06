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
    @treasure = Treasure.create(params[:treasures])

    if @treasure.save
      redirect_to @treasure 
      render action: 'show'
    else
      render action: 'new'
    end
  end
end
