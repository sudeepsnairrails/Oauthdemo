class AddAddressIdToClinics < ActiveRecord::Migration[5.2]
  def change
    add_reference :clinics, :address, foreign_key: true
  end
end
