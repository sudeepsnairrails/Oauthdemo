class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.references :doctor_profile, index: true, foreign_key: true
      t.references :patient_profile, index: true, foreign_key: true
      t.time :time_from
      t.time :time_to
      t.text :description
      t.string :status
      t.boolean :payment_status

      t.timestamps
    end
  end
end
