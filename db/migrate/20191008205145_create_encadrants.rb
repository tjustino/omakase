# frozen_string_literal: true

# Create Encadrants object
class CreateEncadrants < ActiveRecord::Migration[6.0]
  def change
    create_table :encadrants do |t|
      t.string :nom, null: false

      t.timestamps
    end

    add_index :encadrants, :nom, unique: true
  end
end
