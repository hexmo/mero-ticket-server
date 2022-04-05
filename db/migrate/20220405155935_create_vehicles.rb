class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.string :license_plate
      t.text :description
      t.integer :phone

      t.timestamps
    end
  end
end
