module GoalsHelper
  def has_goal?(goal)
    return false unless logged_in?

    current_user.goals.include? goal
  end
end
