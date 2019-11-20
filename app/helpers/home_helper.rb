# frozen_string_literal: true

# Home Helper
module HomeHelper
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
