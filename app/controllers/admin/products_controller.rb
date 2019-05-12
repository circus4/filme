class Admin::ProductsController < ApplicationController
  def index
  end

  def create
    @new_cd = Product.new(products_params)
    @new_cd.save!
  end

  def new
    @new_cd = Product.new
  end

  def edit
    @cd = Product.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def products_params
    params.require(:product).permit(:image, :product_title,:price,:label_name,:stock ,tracks_attributes: [:id,:product_id ,:track_name, :artist_name,:disk_num,:track_order, :_destroy])
  end
end
