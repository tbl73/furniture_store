class InventoryController < ApplicationController
  def all_products
  	@products = Product.all
  end

  def one_product
  	@product = Product.find(params[:id])
  end

  def by_category
  	@category = params[:category]
  	@products = Product.where(category: @category)
  end

  def new
    if params[:name] != nil
      product = Product.create(name: params[:name], price: params[:price],
        category: params[:category])
      redirect_to product_path(id: product.id)

    end
  end

end
