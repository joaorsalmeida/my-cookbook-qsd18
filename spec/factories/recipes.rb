FactoryBot.define do
  factory :recipe do
    title 'Bolo'
    difficulty 'Fácil'
    recipe_type 'Café da tarde'
    ingredients 'Farinha, ovo, manteiga, acucar'
    cook_time 60
    add_attribute(:method) { 'Misturar tudo e assar' }
    cuisine
  end
end
