class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :country
      t.string :pin

      t.timestamps
    end
  end
end
