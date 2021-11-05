class AddFieldsToParcelMachines < ActiveRecord::Migration[6.0]
  def change
    add_column :parcel_machines, :type, :string
    add_column :parcel_machines, :a0_name, :string
    add_column :parcel_machines, :a1_name, :string
    add_column :parcel_machines, :a2_name, :string
    add_column :parcel_machines, :a3_name, :string
    add_column :parcel_machines, :a4_name, :string
    add_column :parcel_machines, :a5_name, :string
    add_column :parcel_machines, :a6_name, :string
    add_column :parcel_machines, :a7_name, :string
    add_column :parcel_machines, :a8_name, :string
    add_column :parcel_machines, :x_coordinate, :string
    add_column :parcel_machines, :y_coordinate, :string
    add_column :parcel_machines, :service_hours, :string
    add_column :parcel_machines, :service_hours_until, :string
    add_column :parcel_machines, :service_hours_2, :string
    add_column :parcel_machines, :service_hours_2_until, :string
    add_column :parcel_machines, :comment_est, :string
    add_column :parcel_machines, :comment_eng, :string
    add_column :parcel_machines, :comment_rus, :string
    add_column :parcel_machines, :comment_lav, :string
    add_column :parcel_machines, :comment_lit, :string
    add_column :parcel_machines, :MODIFIED, :string
  end
end
