class RenameTypeToFacilityInVehicle < ActiveRecord::Migration[6.1]
  def change
    rename_column :vehicles, :type, :facility
  end
end
