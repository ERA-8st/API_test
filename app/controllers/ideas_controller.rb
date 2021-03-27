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
    category = Category.find_by(name: params[:category_name])
    if category.present?
      @idea = category.ideas.create(body: params[:body])
    else
      ActiveRecord::Base.transaction do
        @new_category = Category.create!(name: params[:category_name])
        @idea = @new_category.ideas.create!(body: params[:body])
      rescue
        raise ActiveRecord::Rollback
      end
    end
    if @idea
      render json: 201, status: 201
    else
      render json: 422, status: 422
    end
  end
end
