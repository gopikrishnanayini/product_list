class UsersController < ApplicationController
  before_action :set_product, only: [:new, :show, :create, :edit, :update, :destroy]
  def index
  end
  def new
  	@user = @product.users.build
  end

  def create
    @user = @product.users.build(user_params)
  	@user = User.new(user_params)
  	respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = @product.users.find(params[:id])
  end

  def edit
    @user = @product.users.find(params[:id])
  end

  def update
  	@user = @product.users.find(params[:id])
  	respond_to do |format|
	  	if @user.update(user_params)
	  		format.html { redirect_to @user, notice: 'user was successfully created.'}
	  		format.json { render json: @user, status: :created, location: @user }
	  	else
	  		format.html { render action: "update" }
	  		format.json {render json: @user.errors, status: :unprocessable_entity}
	  	 end
  	end
  end
  def destroy
  	@user = @product.users.find(params[:id])
  	@user.destroy
  	 redirect_to users_path
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def user_params
  	params.require(:user).permit(:name, :address, :quantity)
  end
end