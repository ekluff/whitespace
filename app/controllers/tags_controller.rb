class TagsController < ApplicationController
  def new
    respond_to do |format|
      format.js
    end
  end
end
