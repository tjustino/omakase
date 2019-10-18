module ApplicationHelper
  def list(encadrants)
    content_tag(:ul) do
      encadrants.each do |encadrant|
        concat(content_tag(:li, encadrant.nom))
      end
    end
  end
end
