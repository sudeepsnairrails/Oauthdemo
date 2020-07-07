class CreateDoctorLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_leaves do |t|
      t.date :leave_date
      t.references :doctor_profile, index: true, foreign_key: true

      t.timestamps
    end
  end
end
