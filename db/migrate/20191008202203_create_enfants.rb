class CreateEnfants < ActiveRecord::Migration[6.0]
  def change
    create_table :enfants do |t|
      t.string :nom, null: false

      t.timestamps
    end

    add_index :enfants, :nom, unique: true
  end
end
