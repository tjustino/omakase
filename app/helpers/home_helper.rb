# frozen_string_literal: true

# Home Helper
module HomeHelper
  # GET /
  # Renvoie une liste d'encadrants
  def list(encadrants)
    content_tag(:ul, class: highlighted_or_not(encadrants.count)) do
      encadrants.each do |encadrant|
        concat(content_tag(:li, encadrant.nom))
      end
    end
  end

  def highlighted_or_not(encadrants_count)
    if encadrants_count < 5
      @alerte = "Il n'y a pas toujours 5 encadrants inscrits par enfant"
      "has-background-warning"
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

    "🤯" # si aucun resultat
  end
end
