class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_USERNAME'], password: ENV['HTTP_AUTH_PASSWORD']
  
  def show
    @number_of_products = Product.count
    @number_of_categories = Category.count
  end
end
