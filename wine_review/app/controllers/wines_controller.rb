class WinesController < ApplicationController
  before_action :set_wine, only: [ :show, :edit, :update, :destroy ]

  def new
  	@wine = Wine.new
  end

  def index
    @wines = Wine.order(:name).page(params[:page])
  end

  def show
  end

  def create
  	@wine = Wine.new(wine_params)
  	if @wine.save
      redirect_to @wine, notice: "#{@wine.name} was created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wine.update(wine_params)
      redirect_to @wine, notice: "#{@wine.name} was created!"
    else
      render :new
    end
  end

  def destroy
    @wine.destroy
    redirect_to wines_path
  end

private

  def wine_params
  	params.require(:wine).permit(:name, :winery, :varietal, :country, :year)
  end

  def set_wine
    @wine = Wine.find(params[:id])
  end

end
