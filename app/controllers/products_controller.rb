class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update]

	def index
		@products = Product.current.order(:name)
		@total = @products.map(&:price).inject(:+)
		@areas = @products.map(&:face_area).uniq.sort
		@brands = @products.map(&:brand).uniq.sort
	end

	def show
    
  end

  def new
  end

  def edit
  end

  def create
    @product = Product.create(products_params)
    respond_with @product
  end

  def update
    @product.update(products_params)
    redirect_to @product
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def gone
  	@products = Product.gone
  end

  def open
  	@product = Product.find(params[:product_id])
    @product.open!
    redirect_to(@product)
  end

  def finish
  	@product = Product.find(params[:product_id])
    @product.finish!
    redirect_to(@product)
  end

  def destash
  	@product = Product.find(params[:product_id])
    @product.destash!
    redirect_to(@product)
  end

  private
  	def set_product
      @product = Product.find(params[:id])
    end

    def products_params
      params.require(:product).permit(
      	:brand,
  			:name,
  			:category,
  			:face_area,
  			:review,
  			:rating,
  			:purchase_date,
  			:retailer,
  			:repurchase,
  			:planned,
  			:price,
  			:online,
      	:size,
      	:shade,
      	:color
      )
    end
end
