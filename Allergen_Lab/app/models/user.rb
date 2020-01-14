class User < ApplicationRecord
    has_many :allergies
    has_many :ingredients, through: :allergies
    has_many :recipes, dependent: :destroy

    validates :name, presence: true
end
