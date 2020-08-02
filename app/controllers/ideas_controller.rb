class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    @ideas = Idea.search(@search_term)
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    @display_add_comment = session[:user_id].present?

    if(session[:user_id].present?)
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
    if(idea.save)
      redirect_to(ideas_path)
    else
      render 'new'
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if(@idea.update(idea_resource_params))
    redirect_to account_ideas_path
    else
      render 'edit'
    end
  end

  private 

  def idea_params
    params.permit(:title, :description, :photo_url )
  end

  def idea_resource_params
    params.require(:idea).permit(:title, :photo_url, :done_count, :description)
  end

end
