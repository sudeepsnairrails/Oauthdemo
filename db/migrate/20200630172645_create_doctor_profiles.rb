class CreateDoctorProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_profiles do |t|
      t.string :gender
      t.integer :years_of_experiance
      t.string :register_number
      t.integer :consultation_fee
      t.integer :slot_duration
      t.timestamps
    end
  end
end
