class CreateSpecialisations < ActiveRecord::Migration[5.2]
  def change
    create_table :specialisations do |t|
      t.string :specialisation
      t.boolean :active

      t.timestamps
    end
  end
end
