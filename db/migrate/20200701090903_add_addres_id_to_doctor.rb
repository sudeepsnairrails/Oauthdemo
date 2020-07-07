class AddAddresIdToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctor_profiles, :address, foreign_key: true
  end
end
