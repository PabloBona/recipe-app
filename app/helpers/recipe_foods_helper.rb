module RecipeFoodsHelper
  def create_form(foods_items, recipe_foods, recipe_info)
    if foods_items.length.positive?
      render partial: 'recipe_foods/form', locals: { foods: foods_items, recipe_food: recipe_foods, recipe: recipe_info  }
    else
      "<div class='d-flex column-gap-3'>
                    No foods to add
                    #{link_to 'Return', recipe_path(recipe_info.id), class: 'btn btn-danger btn-lg'} 
                  </div>".html_safe
    end
  end
end
