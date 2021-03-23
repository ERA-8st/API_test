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
    else
      render json: 404, status: 404
    end
  end

  def create
    
  end
  
end
