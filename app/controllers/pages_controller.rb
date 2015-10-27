class PagesController < ApplicationController

  def index
    # use scopes in the model to filter by image tags, exifs, etc. and change accordingly here
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

end
