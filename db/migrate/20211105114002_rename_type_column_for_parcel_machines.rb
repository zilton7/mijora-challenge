class RenameTypeColumnForParcelMachines < ActiveRecord::Migration[6.0]
  def change
    rename_column :parcel_machines, :type, :pm_type
    rename_column :parcel_machines, :MODIFIED, :modified
  end
end
