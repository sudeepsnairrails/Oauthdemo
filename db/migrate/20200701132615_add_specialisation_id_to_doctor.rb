class AddSpecialisationIdToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctor_profiles, :specialisation, foreign_key: true
  end
end
