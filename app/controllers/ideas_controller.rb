class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    @ideas = Idea.search(@search_term)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new ; end

  def create
    idea = Idea.new(idea_params)
    idea.save!
    redirect_to(ideas_path)
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)
    redirect_to account_ideas_path
  end

  private 

  def idea_params
    params.permit(:title, :description, :photo_url )
  end

end
