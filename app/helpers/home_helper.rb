module HomeHelper
  def retrouve_encadrant(jour, enfant, proposition)
    proposition.each do |hash|
      next unless hash[:jour] == jour
      next unless hash[:enfant] == enfant

      return Encadrant.find(hash[:encadrant]).nom
    end
  end
end
