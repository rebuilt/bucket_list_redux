class GoalsController < ApplicationController
  def create
    idea = Idea.find(params[:idea_id])
    current_user.goals << idea
    redirect_to(idea_path(idea))
  end
end
