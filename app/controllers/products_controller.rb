class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:show, :create, :edit, :update, :destroy]


  def index
    @category = Category.find(params[:category_id])
    @products = @category.products
  end


  def new
   @category = Category.find(params[:category_id])
    @product = @category.products.build
  end


  def create
    @product = @category.products.build(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to category_product_path(@category, @product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  @category = Category.find(params[:category_id])
  end

  def edit
    @product = @category.products.find(params[:id])
  end

  def update
    @product = @category.products.build(product_params)
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to category_product_path(@category, @product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to category_products_path(@category), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def product_params
      params.require(:product).permit!
    end
end