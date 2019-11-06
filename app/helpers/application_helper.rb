# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def navbar_item(controller, action)
    if params[:controller] == controller && params[:action] == action
      "navbar-item is-active"
    else
      "navbar-item"
    end
  end

  def navbar_link
    if %w[enfants encadrants].include? params[:controller]
      "navbar-link is-active"
    else
      "navbar-link"
    end
  end
end
