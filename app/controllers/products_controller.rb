class ProductsController < ApplicationController

	def create 
		product = Product.new(product_params)
		category = Category.find(params[:category_id])
		product.category = category 
		product.save
		redirect_to category
		
	end

	def destroy
		product = Product.find(params[:id].to_i)
		product.destroy
		redirect_to category_path(params[:category_id])
	end

	private

	def product_params
		params.require(:product).permit(:name, :price)
	end
end
