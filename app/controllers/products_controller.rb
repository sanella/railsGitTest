class ProductsController < ApplicationController
	def index
		@products_count = Product.count
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		product = Product.new(product_params)
		
		if product.save
			redirect_to(products_path())
		else
			flash[:error] = 'Product create faild!'
			render :new
		end
	end

	def show
		params.inspect
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update_attributes(product_params) #metoda update attributes je vec ranije definisana, product params je dole metoda koju smo defnisali
			redirect_to product_path(@product) #moyemo mu id proslijediti ili citav product i on ce sam znati da ume id i redirecta na tu stranicu
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		product_name = @product.name
		flash[:notice] = "Product with id: #{params[:id]} and name #{product_name}"
		redirect_to products_path
	end

		def product_params
			params.require(:product).permit(:name, :price)
		end
	private :product_params
end
