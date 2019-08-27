class ChangeBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :return, :date
    change_column :bookings, :pickup, :date
    rename_column :bookings, :return, :return_on
    rename_column :bookings, :pickup, :pickup_on
  end
end
