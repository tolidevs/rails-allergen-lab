class RecipesController < ApplicationController

    def index
        # @recipes = params[:sort] ? Recipe.all_sorted_by_ingredients : Recipe.all
        @recipes = Recipe.all_sorted_by_ingredients
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.valid?
            redirect_to recipes_path
        else
            redirect_to new_recipe_path
        end
    end

    # def edit
    #     @recipe = Recipe.find(params[:id])
    # end

    # def update
    #     @recipe = Recipe.find(params[:id])
    #     @recipe.update(recipe_params)
    #     redirect_to @recipe
    # end


    private

    def recipe_params
        params.require(:recipe).permit(:title, :instructions, :user_id, ingredient_ids: [])
    end

end