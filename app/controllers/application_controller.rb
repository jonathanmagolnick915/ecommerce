class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :categories, :brands

  rescue_from CanCan::AccessDenied do |exception|
    respond to do |format|
      format.html { redirect_to root_url, :alert => exception.message }
    end
  end

  def items_in_cart
    @line_items = current_order.line_items
  end

  def categories
  	@categories = Category.all
  end

  def brands
  	@brands = Product.pluck(:brand).uniq.sort	
  end

  protected 

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

end
