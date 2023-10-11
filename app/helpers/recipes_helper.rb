module RecipesHelper
  def trim_text(text)
    text.length <= 85 ? text : "#{text[0..200]}..."
  end

  def delete_button(recipe)
    content = ''
    if can?(:destroy, recipe)
      content << button_to('Remove', recipe_path(recipe), method: :delete,
                                                          class: 'fs-5 border border-0 bg-transparent
                                                                  text-decoration-underline text-primary').to_s
    end
    content.html_safe
  end

  def public?(recipe)
    content = ''
    if can?(:update, recipe)
      content = if recipe.public
                  (button_to '', recipe_path(recipe), method: :patch, params: { recipe: { public: false } },
                                                      remote: true, class: 'public-btn').to_s
                else
                  (button_to '', recipe_path(recipe), method: :patch, params: { recipe: { public: true } },
                                                      remote: true, class: 'public-btn-false').to_s
                end
    end
    content.html_safe
  end

  def details_buttons(recipe)
    content = ''
    if can?(:create, recipe)
      content << (link_to 'Generate shopping list', general_shopping_lists_url, class: 'buttons btn btn-primary auto-width').to_s
      content << (link_to 'Add ingredient', new_recipe_food_path(recipe), class: 'buttons btn btn-primary auto-width').to_s
    end
    content.html_safe
  end

  def recipe_actions(food, recipe_food)
    content = ''
    unless can?(:update, food) && can?(:destroy, food)
      content << '<span>No actions permited</span>'
      return content.html_safe
    end
    content << (link_to 'Modify', edit_recipe_food_path(recipe_food), class: 'link-info p-2').to_s
    content << (button_to 'Remove', recipe_food_path(food), method: :delete, class: 'btn btn-link link-warning').to_s
    content.html_safe
  end
end
