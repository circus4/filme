class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(4)
  end

  def create
    @new_cd = Product.new(products_params)
    if @new_cd.save
      flash[:cd] = "successful Created CD!!"
    else
      render :new
    end
    @new_cd.save!
  end

  def new
    @new_cd = Product.new

  end

  def edit
    @cd = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update
    redirect_to admin_movie_path(@product)
  end

  def destroy
  end

  private
  def products_params
    params.require(:product).permit(:image, :product_title,:price,:label_name,:stock ,tracks_attributes: [:id,:product_id ,:track_name, :artist_name,:disk_num,:track_order, :_destroy])
  end
end
