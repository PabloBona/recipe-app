module RecipesHelper
  def delete_button(recipe)
    content = ''
    if can?(:destroy, recipe)
      content << button_to('Remove', recipe_path(recipe), method: :delete,
                                                          class: 'fs-5 border border-0 bg-transparent
                                                                  text-decoration-underline text-primary').to_s
    end
    content.html_safe
  end
end
