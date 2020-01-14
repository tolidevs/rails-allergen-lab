class Recipe < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :title, presence: true
    validates :instructions, presence: true

    def self.all_sorted_by_ingredients
        self.all.sort_by{ |recipe| -recipe.ingredients.count }
    end
end
