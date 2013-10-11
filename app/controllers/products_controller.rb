class ProductsController < ApplicationController

	respond_to :html, :json, :js

	def index
		@products = Product.all
		respond_with @products
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
		respond_to do |format|
			if @product.save
				AudioSlicer.perform_async(@product.id.to_s)
				format.html { redirect_to products_path, notice: 'Product was successfully created.' }
			else
				flash[:notice] = @product.errors.full_messages.first
				format.html { render action: :new, notice: 'Product was successfully created.' }
			end
		end
	end

	def show
		@product = Product.find(params[:id])
		respond_with @product
	end

	def edit
		@product = Product.find(params[:id])
		respond_with @product
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			respond_to do |format|
				format.html { redirect_to product_path(@product), notice: 'Product was successfully updated.' }
			end
		else
			flash[:notice] = @product.errors.full_messages.first
			respond_to do |format|
				format.html { render :edit }
			end
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		flash[:notice] = 'Your product was successfully deleted'
		respond_to do |format|
			format.html { redirect_to products_path }
		end
	end

end
