class IdeasController < ApplicationController

  def index
    if params[:category_name].present?
      category = Category.find_by(name: params[:category_name])
      if category.present?
        @ideas = category.ideas
      end
    else
      @ideas = Idea.all
    end
    if @ideas
      render 'index', formats: 'json', handlers: 'jbuilder'
      # render status: 429
    else
      render status: 429
    end
  end

  def create
    
  end
  
end
