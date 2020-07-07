class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
        create_join_table :clinics, :doctor_profiles
        add_index :clinics_doctor_profiles, [:clinic_id, :doctor_profile_id], unique: true, name: 'index_clinics_doctor_profiles'
  end
end
