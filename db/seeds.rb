# db/seeds.rb

# Crear usuarios
user1 = User.create!(
  name: "Ejemplo Usuario 1",
  email: "usuario1@example.com",
  password: "password123",
  confirmed_at: Time.now
)

user2 = User.create!(
  name: "Ejemplo Usuario 2",
  email: "usuario2@example.com",
  password: "password123",
  confirmed_at: Time.now
)

# Crear alimentos asociados a usuarios específicos
food1 = user1.foods.create!(name: 'Apple', measurement_unit: 'piece', price: 1, quantity: 10)
food2 = user1.foods.create!(name: 'Banana', measurement_unit: 'piece', price: 2, quantity: 8)

food3 = user2.foods.create!(name: 'Orange', measurement_unit: 'piece', price: 1, quantity: 12)
food4 = user2.foods.create!(name: 'Carrot', measurement_unit: 'piece', price: 1, quantity: 15)

# Crear recetas asociadas a usuarios específicos y alimentos específicos
recipe1 = user1.recipes.create!(
  name: 'Fruit Salad',
  preparation_time: 10,
  cooking_time: 0,
  description: 'Healthy fruit salad recipe.',
  public: true
)

recipe2 = user2.recipes.create!(
  name: 'Carrot Soup',
  preparation_time: 15,
  cooking_time: 20,
  description: 'Delicious carrot soup recipe.',
  public: true
)

# Asociar alimentos a recetas
RecipeFood.create!(recipe: recipe1, food: food1, quantity: 2)
RecipeFood.create!(recipe: recipe1, food: food2, quantity: 3)

RecipeFood.create!(recipe: recipe2, food: food3, quantity: 4)
RecipeFood.create!(recipe: recipe2, food: food4, quantity: 5)

puts "Seed data created successfully!"
