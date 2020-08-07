class IdeasController < ApplicationController
  before_action :ensure_authenticated, only: %i[edit update]
  before_action :ensure_owner,         only: %i[edit update]
  before_action :load_idea,            only: %i[edit update]

  def index
    @search_term = params[:q]
    @ideas = Idea.search(@search_term)
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    @display_add_comment = session[:user_id].present?
    @disable_add_goal = false
    if logged_in?
      @disable_add_goal = current_user.goals.any? { |idea| idea == @idea }
      @user = User.find(session[:user_id])
      @disable_add_goal = @user.goals.exists?(@idea.id)
    else
      @user = nil
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_resource_params)
    user = User.find(session[:user_id])
    idea.user = user
    if idea.save
      redirect_to(ideas_path)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @idea.update(idea_resource_params)
      redirect_to account_ideas_path
    else
      render 'edit'
    end
  end

  private

  def idea_params
    params.permit(:title, :description, :photo_url)
  end

  def idea_resource_params
    params.require(:idea).permit(:title, :photo_url, :done_count, :description)
  end

  def ensure_owner
    redirect_to account_path unless @idea.user == current_user
  end

  def load_idea
    @idea = Idea.find(params[:id])
  end
end
