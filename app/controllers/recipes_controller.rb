class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  before_action :set_cuisines, only: [:new, :edit]

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      set_cuisines
      flash.now[:error] = 'Não foi possível salvar sua receita'
      render :new
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params())

    flash[:success] = 'Sua receita foi atualizada com sucesso'
    redirect_to @recipe
  end

  def search
    search_term = "%#{params[:q]}%"
    @results = Recipe.where('title LIKE ? or ingredients LIKE ?', search_term, search_term)
    flash.now[:alert] = "Nenhuma receita encontrada" unless @results.any?
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
                                   :recipe_type, :cuisine_id, :difficulty,
                                   :cook_time, :ingredients, :method)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_cuisines
    @cuisines = Cuisine.all
  end
end
