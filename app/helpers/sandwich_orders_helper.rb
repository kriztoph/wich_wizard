module SandwichOrdersHelper
  def sandwich_order_ingredients(category)
    @sandwich_order.ingredients_by_category(category).pluck(:ingredient).join(", ")
  end
end
