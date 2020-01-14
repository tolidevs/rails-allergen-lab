class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(ingredient_params)
        if @ingredient.valid?
            redirect_to @ingredient
        else
            redirect_to new_ingredient_path
        end
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        @ingredient.update(ingredient_params)
        redirect_to @ingredient
    end


    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

end