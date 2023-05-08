class Admin::DashboardController < BaseController
  
  def show
    @number_of_products = Product.count
    @number_of_categories = Category.count
  end
end
