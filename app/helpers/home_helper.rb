# frozen_string_literal: true

# Home Helper
module HomeHelper
  # GET /
  # Renvoie une liste d'encadrants
  def list(encadrants)
    content_tag(:ul) do
      encadrants.each do |encadrant|
        concat(content_tag(:li, encadrant.nom))
      end
    end
  end

  # GET /dice
  # Renvoie l'encadrant dans le hash de la proposition
  def retrouve_encadrant(jour, enfant, proposition)
    proposition.each do |hash|
      next unless hash[:jour] == jour
      next unless hash[:enfant] == enfant

      return Encadrant.find(hash[:encadrant]).nom
    end
  end
end
