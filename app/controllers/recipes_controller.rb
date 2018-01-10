class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
  end

  def create
    recipe_params = params.require(:recipe).permit(:title,
                                                :recipe_type, :cuisine_id, :difficulty,
                                                :cook_time, :ingredients, :method)
    @cuisines = Cuisine.all
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:error] = 'Não foi possível salvar sua receita'
      render :new
    end
  end
end
