class CreateInscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :inscriptions do |t|
      t.references :enfant, null: false, foreign_key: true
      t.references :encadrant, null: false, foreign_key: true
      t.integer :jour, null: false

      t.timestamps
    end

    add_index :inscriptions, %i[enfant_id encadrant_id jour], unique: true
  end
end
