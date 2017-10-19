class StorefrontController < ApplicationController
  def all_items
  	@products = Product.all
  end

  def items_by_category
  	# @category = Category.find(params[:cat_id])
  	# @products_all = Product.all
  	# @products = []

  	# products_all.each do |product|
  	# 	if product.category_id == @category.id
  	# 		@products.push(product)
  	# 	end
  	# end
  	
  	@products = Product.where(category_id: params[:cat_id])
  	@category = Category.find(params[:cat_id])

  end


  def items_by_brand

    # @brand_name = params[:brand]
    # @products_all = Product.all
    # @products = []

    # @products_all.each do |product| 
    #   if product.brand == @brand_name
    #     @products.push(product)
    #   end
    # end
    
    @products = Product.where(brand: params[:brand])
    @brand = params[:brand]


  end

end
