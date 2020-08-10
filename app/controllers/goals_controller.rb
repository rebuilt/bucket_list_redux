class GoalsController < ApplicationController
  before_action :ensure_authenticated, only: :create

  def create
    @idea = Idea.find(params[:idea_id])
    current_user.goals << @idea

    respond_to do |format|
      format.html { redirect_to idea_path(idea) }
      format.js { render 'create' }
    end
  end
end
