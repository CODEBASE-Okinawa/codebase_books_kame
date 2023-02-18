class RenameReserveColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :reserve_start, :reserved_start
    rename_column :reservations, :reserve_end, :reserved_end
  end
end
