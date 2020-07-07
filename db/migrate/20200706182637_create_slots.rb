class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :status
      t.references :doctor_profile, index: true, foreign_key: true
      t.references :day_of_week, index: true, foreign_key: true
      t.timestamps
    end
  end
end
