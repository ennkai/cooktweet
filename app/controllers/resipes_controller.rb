class ResipesController < ApplicationController

  def index
    @resipes = Resipe.all
  end

end
