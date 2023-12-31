class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :create, [Recipe, Food, RecipeFood], user_id: user.id
    can :destroy, [Recipe, Food, RecipeFood], user_id: user.id
    can :update, [Recipe, Food, RecipeFood], user_id: user.id
  end
end
