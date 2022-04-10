class ChangePhoneFromIntToBigintInVehicle < ActiveRecord::Migration[6.1]
  def change
    change_column :vehicles, :phone, :bigint
  end
end
