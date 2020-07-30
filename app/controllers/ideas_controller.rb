class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    @ideas = Idea.all
  end

  def new

  end

  def create
    idea = Idea.new
    idea.title = params[:title]
    idea.done_count = params[:done_count]
    idea.photo_url = params[:photo_url]
    idea.save!
    redirect_to(ideas_index_path)
  end
end
