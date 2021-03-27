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
      @idea = category.ideas.new(body: params[:body])
    else
      ActiveRecord::Base.transaction do
        new_category = Category.new(name: params[:category_name])
        @idea = new_category.ideas.new(body: params[:body])
      end
    end
    if @idea.save
      render json: 201, status: 201
    else
      render json: 422, status: 422
    end
  end
end
