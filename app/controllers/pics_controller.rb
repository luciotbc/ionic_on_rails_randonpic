class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :update, :destroy]

  # GET /pics
  def index
    @pics = Pic.all.limit(20).reverse

    render json: @pics
  end

  # POST /pics
  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      render json: @pic, status: :created, location: @pic
    else
      render json: @pic.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pic_params
      params.require(:pic).permit(:photo)
    end
end
