class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    @ideas = Idea.search(@search_term)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new 
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_resource_params)
    idea.save!
    redirect_to(ideas_path)
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    idea = Idea.find(params[:id])
    idea.update(idea_resource_params)
    redirect_to account_ideas_path
  end

  private 

  def idea_params
    params.permit(:title, :description, :photo_url )
  end

  def idea_resource_params
    params.require(:idea).permit(:title, :photo_url, :done_count, :description)
  end

end
