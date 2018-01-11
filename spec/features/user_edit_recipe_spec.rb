require 'rails_helper'

feature 'User edit recipe' do
  scenario 'successfully' do
    cuisine = Cuisine.create(name: 'Brasileira')
    another_cuisine = Cuisine.create(name: 'Italiana')

    recipe = Recipe.create(title: 'Massa', cook_time: 40, difficulty: 'Fácil',
                          ingredients: 'Farinha e agua', cuisine: cuisine,
                          method: 'Misturar e passar na maquina')

    new_recipe = Recipe.new(title: 'Massa com farofa')
    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Título', with: new_recipe.title
    select 'Brasileira', from: 'Cozinha'
    fill_in 'Dificuldade', with: 'Médio'
    fill_in 'Como Preparar', with: 'Misturar a farofa com a massa'

    click_on 'Atualizar'

    expect(page).to have_content('Sua receita foi atualizada com sucesso')
    expect(page).to have_css('h1', text: new_recipe.title)
    expect(page).to have_content('Médio')
    expect(page).to have_content('Misturar a farofa com a massa')
    expect(page).to have_content('Brasileira')
  end
end
