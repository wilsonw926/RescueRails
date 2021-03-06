module EventsHelper
  def current_scope
    scopes[@scope]
  end

  def alternate_scope_string
    scopes[alternate_scope]
  end

  def alternate_scope
    @scope=="past" ? "upcoming" : "past"
  end

  def photographer?(event)
    event.photographer_name? ? "d-block;" : "d-none"
  end

  private
  def scopes
    {"upcoming" => t(".title.upcoming"), "past" => t(".title.past")}
  end
end
