module GoalsHelper
  def has_goal?(goal)
    return false unless logged_in?

    # @goals ||= current_user.goals

    # @goals.include? goal
    current_user.goals.include? goal
  end
end
