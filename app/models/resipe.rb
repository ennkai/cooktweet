class Resipe < ApplicationRecord
 belongs_to :user
 #has_many :ingredients, through :resipe_ingredients
 #has_many :seasonings, through :resipe_seasonings
 #has_many :likes

end
