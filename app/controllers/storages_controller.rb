class StoragesController < ApplicationController
  def index
    @storage = current_user.storages
  end

  def show
    @storage = Storage.find(params[:id])
  end

  def new
    @storage = Storage.new
  end

  def create
    @storage = current_user.storages.build(params_storage)
   
    if @storage.save
      redirect_to @storage 
    else
      render :new
    end
  end

  def edit
    @storage = Storage.find(params[:id])
    render :edit    
  end

  def update
    @storage = Storage.find(params[:id])
    
    if @storage.update(params_storage)
      redirect_to @storage
    else
      render :edit
  end
    end

  def destroy
    @storage = Storage.find(params[:id])
    @storage.destroy
    @storage.save

    redirect_to storages_path
  end
  
  private

  def params_storage
        params.require(:storage).permit(:name, :address_id)
      end
end
