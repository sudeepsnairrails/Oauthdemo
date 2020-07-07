class CreatePatientProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_profiles do |t|
      t.string :gender
      t.string :blood_group
      t.datetime :dob
      t.integer :height
      t.integer :weight
      t.references :address, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
