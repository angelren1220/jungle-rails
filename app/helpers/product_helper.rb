module ProductHelper
  def is_sold_out?
    return self.quantity.zero?
  end
end
