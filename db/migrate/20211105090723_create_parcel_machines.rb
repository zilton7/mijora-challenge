class CreateParcelMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :parcel_machines do |t|
      t.string :name
      t.string :zip

      t.timestamps
    end
  end
end
